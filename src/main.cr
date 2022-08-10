require "./pocbrowser/*"


Pocbrowser::CLI.new ARGV
config = Pocbrowser::Config.config
config.setup
