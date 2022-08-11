require "./scrapers/dispach.cr"

module Pocbrowser
    class Runner
        def run
            config    = Pocbrowser::Config.config
            results   = Hash(String,Hash(String, Array(String))).new
            channel   = Channel(Nil).new
            waitgroup = 0

            config.targets.each do |target|
                results[target] = Hash(String, Array(String)).new
                config.modes.each do |mode|
                    results[target][mode] = [] of String
                    waitgroup += 1
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
            puts results
        end
    end
end