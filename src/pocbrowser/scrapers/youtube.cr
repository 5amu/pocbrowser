require "http/client"
require "json"

module Pocbrowser
  class YoutubeScraper
    def parse(cve : String)
      endpoint = "https://www.youtube.com/results?search_query=intitle:#{cve}+poc"
      results = [] of String

      HTTP::Client.get endpoint do |r|
        # Return [] if status code != 200
        if r.status_code != 200
          yield results
          return
        end

        body = r.body_io.gets
        if body != nil && !body.as(String).includes?("ytInitialData")
          yield results
          return
        end
        body = body.as(String)

        # Youtube puts json after this token
        json_starts = body.index("ytInitialData").as(Int32) + "ytInitialData".size + 3
        json_finish = body.index("};").as(Int32) + 1

        # https://crystal-lang.org/api/1.3.2/String.html#%5B%5D%28start%3AInt%2Ccount%3AInt%29%3AString-instance-method
        json_string = body[json_starts, json_finish - json_starts]
        data = JSON.parse(json_string)

        begin
          # Search videos regarding the asked cve using some Google style keywords
          # Heavily inspired by https://github.com/joetats/youtube_search
          data["contents"].as_h["twoColumnSearchResultsRenderer"].as_h["primaryContents"].as_h["sectionListRenderer"].as_h["contents"].as_a[0].as_h["itemSectionRenderer"].as_h["contents"].as_a.each do |video|
            video_data = video["videoRenderer"].as_h
            results << video_data["videoId"].as_s
          end
        rescue exception
          yield results
          return
        end
      end
      yield ["lolz", "lolz2"]
    end
  end
end
