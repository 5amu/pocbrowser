require "./*"

module Pocbrowser
  # Allowed crawlers for CVE presented in CLI
  ALLOWED_MODES = [
    "yt", # youtube
    "gh", # github
    "cb", # cvebase
    "ed", # exploitdb
  ]

  MODE_TO_SCRAPER = {
    "yt" => Pocbrowser::YoutubeScraper.new,
    "gh" => Pocbrowser::GithubScraper.new,
    "cb" => Pocbrowser::CveBaseScraper.new,
    "ed" => Pocbrowser::ExploitDBScraper.new,
  }
end
