require "http/client"
require "yaml"

module Pocbrowser
  class CveBaseScraper
    def parse(cve : String)
      # Notation of raw page on github is:
      # https://<url>/cvebase/cvebase.com/main/cve/2000/1xxx/CVE-2000-1209.md
      builder = cve.downcase.gsub("-") { "/" } # CVE-2021-2021 => cve/2021/2021
      builder = builder[0, builder.size - 3]
      endpoint = "https://raw.githubusercontent.com/cvebase/cvebase.com/main/#{builder}xxx/#{cve.upcase}.md"
      results = [] of String

      HTTP::Client.get endpoint do |r|
        # Return [] if status code != 200
        if r.status_code != 200
          yield results
          return
        end

        data = YAML.parse(r.body_io)

        begin
          data["pocs"].as_a.each do |poc|
            results << poc.as_s
          end

        rescue exception
          yield results
          return

        end

        # Finally return the results
        yield results
      end
    end
  end
end
