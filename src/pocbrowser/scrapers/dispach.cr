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
    "yt" => Pocbrowser::YoutubeScraper,
    "gh" => Pocbrowser::GithubScraper,
    "cb" => Pocbrowser::CveBaseScraper,
    "ed" => Pocbrowser::ExploitDBScraper,
  }
end
