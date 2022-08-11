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
                parser.banner =  <<-END_BANNER
                   ___   __    __    ___  ___    __   _    _  ___  ___  ___  
                  (  ,\\ /  \\  / _)  (  ,)(  ,)  /  \\ ( \\/\\/ )/ __)(  _)(  ,) 
                   ) _/( () )( (_    ) ,\\ )  \\ ( () ) \\    / \\__ \\ ) _) )  \\ 
                  (_)   \\__/  \\__)  (___/(_)\\_) \\__/   \\/\\/  (___/(___)(_)\\_)
                  
                                        🔍 by 5amu (https://github.com/5amu)
                
                Usage: pocbrowser [-h|-v|-f <file>|-m <mode>] [CVE1 CVE2 ...]
            
                POSITIONAL ARGUMENTS
                    <CVE> [CVE1 CVE2 ...]            Space separated list of CVEs
                
                ALLOWED MODES
                    gh: github, cb: cvebase, yt: youtube, ed: exploitdb
                
                OPTIONAL ARGUMENTS
                END_BANNER
            
                parser.on("-f F", "--file=FILE", "Newline separated CVE list in file") { |fname| @config.filename = fname }
                parser.on("-o O", "--output=OUT", "Output file (json)") { |outfile| @config.outfile = outfile }
                parser.on("-m M", "--mode=MODE", "Choose one or more modes to search for CVEs") { |mode| @config.modes << mode }
                parser.on("-q", "--quiet", "Don't produce output in stdout") { @config.quiet = true }
                parser.on("-v", "--version", "Show version") { puts "#{APPNAME} version #{VERSION}"; exit }
                parser.on("-h", "--help", "Show help") { puts parser; puts ""; exit }
            
                # Positional argument <CVE1> <CVE2>...
                parser.unknown_args do |args, _|
                    @config.targets = args
                end
            end
        end
    end
end