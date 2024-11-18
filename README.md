<h1 align="center">
    <br>
    <img src="assets/pocbrowser_logo.png" width="200px" alt="DNSHunter">
    <br>
    🔎 POC Browser 🔍
</h1>

<h4 align="center">A tool to find exploits for a given CVE.</h4>

---

## Very cool, but what it does?

The tool is basically a scraper, it scrapes some websites to find repositories, code or videos involving the exploitation of a [CVE id](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures). At the time of writing, it supports scraping for:

* GitHub, using [their API](https://docs.github.com/en/rest/search#search-repositories)
* CVEBase, reading from [their repository](https://github.com/cvebase/cvebase.com/)
* ExploitDB, scraping the search page
* Youtube, scraping the results page

## Usage

```
$ pocbrowser --help
```

## Install

```bash
pipx install git+ssh://git@github.com/5amu/pocbrowser.git
```
