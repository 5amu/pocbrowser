# PoC Browser 🔍

This is very similar to another project of mine, but I implemented it using [Crystal](https://crystal-lang.org/) because "Why Not?"

## Very cool, but what it does?

The tool is basically a scraper, it scrapes some websites to find repositories, code or videos involving the exploitation of a [CVE id](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures). At the time of writing, it supports scraping for:

* GitHub, using [their API](https://docs.github.com/en/rest/search#search-repositories)
* CVEBase, reading from [their repository](https://github.com/cvebase/cvebase.com/)
* ExploitDB, scraping the search page
* Youtube, scraping the results page

## Usage

```
$ pocbrowser --help

   ___   __    __    ___  ___    __   _    _  ___  ___  ___  
  (  ,\ /  \  / _)  (  ,)(  ,)  /  \ ( \/\/ )/ __)(  _)(  ,) 
   ) _/( () )( (_    ) ,\ )  \ ( () ) \    / \__ \ ) _) )  \ 
  (_)   \__/  \__)  (___/(_)\_) \__/   \/\/  (___/(___)(_)\_)
  
                        🔍 by 5amu (https://github.com/5amu)

Usage: pocbrowser [-h|-v|-f <file>|-m <mode>] [CVE1 CVE2 ...]

POSITIONAL ARGUMENTS
    <CVE> [CVE1 CVE2 ...]            Space separated list of CVEs

ALLOWED MODES
    gh: github, cb: cvebase, yt: youtube, ed: exploitdb

OPTIONAL ARGUMENTS
    -f F, --file=FILE                Newline separated CVE list in file
    -o O, --output=OUT               Output file (json)
    -m M, --mode=MODE                Choose one or more modes to search for CVEs
    -q, --quiet                      Don't produce output in stdout
    -v, --version                    Show version
    -h, --help                       Show help
```

## Installation

Get it from the [release page](https://github.com/5amu/pocbrowser/releases) of this repo. It is built with a Github action, so you can trust the binary.