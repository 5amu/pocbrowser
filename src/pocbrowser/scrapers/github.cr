require "http/client"
require "json"

module Pocbrowser
    class GithubScraper
        def parse(cve : String)
            endpoint = "https://api.github.com/search/repositories?q=#{cve}&page=1"
            results  = [] of String

            HTTP::Client.get endpoint do |r|
                # Return [] if status code != 200
                if r.status_code != 200
                    yield results
                    return
                end

                # Should return JSON object
                # https://docs.github.com/en/rest/search#search-repositories
                search_results = JSON.parse(r.body_io)
                
                begin
                    # Return [] if "total_count" = 0 or it is not an int
                    if search_results["total_count"].as_i == 0
                        yield results 
                        return
                    end

                    search_results["items"].as_a.each do |item|
                        url = item["html_url"].as_s
                        if url
                            results << url
                        end 
                    end

                # Return [] if a key cannot be found in json
                # OR if a value is not of an expected type 
                rescue ex : KeyError | TypeCastError 
                    yield results

                end

                # Finally return the results
                yield results   
            end
        end
    end
end