# frozen_string_literal: true

module Year2015
  class Day14 < Solution
    SECONDS = 2503

    def part_one
      data.map do |(speed, fly, rest)|
        cycle = fly + rest
        (SECONDS / cycle * fly + [SECONDS % cycle, fly].min) * speed
      end.max
    end

    def part_two
      (1..SECONDS).each_with_object({}) do |seconds, reindeer|
        max_indexes(seconds).each_with_object(reindeer) do |(_, index), reindeer|
          reindeer[index] = (reindeer[index] || 0) + 1
        end
      end.values.max
    end

    private

    def process_input(line)
      line.scan(/[-\d]+/).map(&:to_i)
    end

    def max_indexes(seconds)
      data.each_with_index.map do |(speed, fly, rest), index|
        cycle = fly + rest
        distance = (seconds / cycle * fly + [seconds % cycle, fly].min) * speed
        [distance, index]
      end.group_by(&:first).max_by(&:first).last
    end
  end
end
