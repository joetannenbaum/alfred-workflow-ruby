require 'result'
require 'json'

module Alfred3
    class Workflow

        def initialize
            @results = []
        end

        public
        def result
            result = Result.new

            @results << result

            result
        end

        public
        def sort_results(direction = 'asc', property = 'title')
            @results.sort! { |r1, r2|
                r1_prop = r1.instance_variable_get("@#{property}")
                r2_prop = r2.instance_variable_get("@#{property}")

                multiplier = direction === 'asc' ? 1 : -1

                r1_prop <=> r2_prop * multiplier
            }

            self
        end

        public
        def output
            {
                items: @results.map { |result|
                            result.to_hash
                        }
            }.to_json
        end

    end
end
