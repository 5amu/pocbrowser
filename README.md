<h1 align="center">
    <br>
    <img src="assets/pocbrowser_logo.png" width="200px" alt="DNSHunter">
    <br>
    🔎 POC Browser 🔍
</h1>

<h4 align="center">A tool to find exploits for a given CVE.</h4>

<p align="center">
    <img src="https://github.com/5amu/pocbrowser/actions/workflows/release.yml/badge.svg">
    <img src="https://github.com/5amu/pocbrowser/actions/workflows/validate.yml/badge.svg">
</p>

---

## Very cool, but what it does?

The tool is basically a scraper, it scrapes some websites to find repositories, code or videos involving the exploitation of a [CVE id](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures). At the time of writing, it supports scraping for:

* GitHub, using [their API](https://docs.github.com/en/rest/search#search-repositories)
* CVEBase, reading from [their repository](https://github.com/cvebase/cvebase.com/)
* ExploitDB, scraping the search page
* Youtube, scraping the results page

I implemented it using [Crystal](https://crystal-lang.org/) because "Why Not?"

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

## Install

Get it from the [release page](https://github.com/5amu/pocbrowser/releases) of this repo.