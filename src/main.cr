# Author: 5amu (https://github.com/5amu)
#
# Honest opinion for a guy that used crystal for the first time:
# it is a very good language, but not very well documented. It
# also misses a good language server to help programmers type less
# code. Other than that seems pretty fast and reliable :)
#
require "./pocbrowser/*"

module Pocbrowser
    class Main
        def main(args)
            Pocbrowser::CLI.new args
            Pocbrowser::Config.config.setup
            Pocbrowser::Runner.new.run
        end
    end
end

Pocbrowser::Main.new.main ARGV