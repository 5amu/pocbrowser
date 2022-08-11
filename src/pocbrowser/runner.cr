require "./scrapers/dispach.cr"

module Pocbrowser
    class Runner
        def run
            # Singleton instance returning configurations harvested
            # by Pocbrowser::CLI
            config    = Pocbrowser::Config.config

            # Results are recorded in an Hash
            # { "target" => { "mode1" => [], "mode2" => [] } }
            results   = Hash(String,Hash(String, Array(String))).new
            
            # Concurrency control
            # channel survives between fibers
            # waitgroup keeps track of the number of fibers that have to return
            channel   = Channel(Nil).new
            waitgroup = 0

            # If user didn't specify a mode, run all modes
            if config.modes.size == 0
                config.modes = ALLOWED_MODES
            end

            # Iterate targets
            config.targets.each do |target|
                results[target] = Hash(String, Array(String)).new

                # Iterate modes
                config.modes.each do |mode|
                    results[target][mode] = [] of String
                    waitgroup += 1

                    # Launch a fiber
                    # https://crystal-lang.org/reference/1.5/guides/concurrency.html
                    spawn do
                        # Iterate between scrapers based on defined modes
                        MODE_TO_SCRAPER[mode].new.parse(target) do |output|
                            output.each do |result|
                                results[target][mode] << result
                            end
                        end
                        channel.send(nil)
                    end
                end
            end
            # Wait for all fibers to complete
            waitgroup.times do
                channel.receive
            end
            
            # Print output
            puts results
        end
    end
end