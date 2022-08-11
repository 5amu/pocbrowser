require "./validator.cr"

module Pocbrowser

    # Application name
    APPNAME = "pocbrowser"

    # Get version at compile time in /shard.yml 
    VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

    #
    # This class stores all configurations for PoCBrowser.
    # It is accessible as follows: Pocbrowser::Config.config
    # 
    class Config
        INSTANCE = Config.new
        
        property targets, modes : Array(String)
        property filename : String

        def initialize
            @targets  = [] of String
            @modes    = [] of String
            @filename = ""
        end

        def setup
            validator = Pocbrowser::Validator.new
            
            # Validate targets (well formatted CVE ids)
            targets.each do |cve|
                abort "#{cve} is not a valid CVE" if !validator.is_valid_cve(cve)
            end

            # Validate modes (belonging to the list of supported modes)
            modes.each do |mode|
                abort "#{mode} is not a valid MODE" if !validator.is_valid_mode(mode)
            end

            # Check if the file (if provided) is ok
            if filename != ""
                abort "Invalid file: #{filename}" if !validator.is_valid_file(filename)
                abort "Cannot specify both CVE and -f FILE" if targets.size != 0
                # Load targets from file 
                File.each_line(filename) do |line|
                    targets << line
                end
            end

            abort "Provide at least one target" if targets.size == 0
        end

        def self.config
            yield Config::INSTANCE
        end
    
        def self.config
            Config::INSTANCE
        end
    end
end