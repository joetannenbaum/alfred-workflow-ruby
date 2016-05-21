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
        @results.sort { |r1, r2|
            if direction === 'asc'
                return r1[property.to_sym] <=> r2[property.to_sym]
            end

            r2[property.to_sym] <=> r1[property.to_sym]
        }
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
