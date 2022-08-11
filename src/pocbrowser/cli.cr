require "option_parser"
require "./config.cr"
require "./scrapers/*"

module Pocbrowser
  class CLI
    def initialize(args)
      @config = Pocbrowser::Config.config
      parse args
    end

    private def parse(args : Array(String))
      OptionParser.parse do |parser|
        message = "\n"
        message += "          ___   __    __    ___  ___    __   _    _  ___  ___  ___\n"
        message += "         (  ,\\ /  \\  / _)  (  ,)(  ,)  /  \\ ( \\/\\/ )/ __)(  _)(  ,)\n"
        message += "          ) _/( () )( (_    ) ,\\ )  \\ ( () ) \\    / \\__ \\ ) _) )  \\\n"
        message += "         (_)   \\__/  \\__)  (___/(_)\\_) \\__/   \\/\\/  (___/(___)(_)\\_)\n"
        message += "\n"
        message += "                               🔍 by 5amu (https://github.com/5amu)\n"
        message += "\n"
        message += "Usage: pocbrowser [-h|-v|-f <file>|-m <mode>] [CVE1 CVE2 ...]\n"
        message += "\n"
        message += "POSITIONAL ARGUMENTS\n"
        message += "\n"
        message += "    <CVE> [CVE1 CVE2 ...]            Space separated list of CVEs\n"
        message += "\n"
        message += "ALLOWED MODES\n"
        message += "\n"
        message += "    gh: github, cb: cvebase, yt: youtube, ed: exploitdb\n"
        message += "\n"
        message += "OPTIONAL ARGUMENTS\n"
        parser.banner = message

        parser.on("-f F", "--file=FILE", "Newline separated CVE list in file") { |fname| @config.filename = fname }
        parser.on("-o O", "--output=OUT", "Output file (json)") { |outfile| @config.outfile = outfile }
        parser.on("-m M", "--mode=MODE", "Choose one or more modes to search for CVEs") { |mode| @config.modes << mode }
        parser.on("-q", "--quiet", "Don't produce output in stdout") { @config.quiet = true }
        parser.on("-v", "--version", "Show version") { puts "#{APPNAME} version #{VERSION}"; exit }
        parser.on("-h", "--help", "Show help") { puts parser; puts ""; exit }

        # Positional argument <CVE1> <CVE2>...
        parser.unknown_args do |others, _|
          @config.targets = others
        end
      end
    end
  end
end
