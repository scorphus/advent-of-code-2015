# frozen_string_literal: true

module Year2015
  class Day09 < Solution
    def part_one
      all_routes.min
    end

    def part_two
      all_routes.max
    end

    private

    def initialize(input)
      super
      @locations = Set.new
      @distances = {}
    end

    def process_input(line)
      loc_a, _, loc_b, _, dist_srt = line.split
      @locations << loc_a << loc_b
      @distances[[loc_a, loc_b]] = @distances[[loc_b, loc_a]] = dist_srt.to_i
    end

    def all_routes
      data
      @locations.to_a.permutation.map do |route|
        route.each_cons(2).reduce(0) do |sum, leg|
          sum + @distances[leg]
        end
      end
    end
  end
end
