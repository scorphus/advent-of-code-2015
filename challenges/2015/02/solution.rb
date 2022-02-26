# frozen_string_literal: true

module Year2015
  class Day02 < Solution
    def part_one
      data.map do |h, l, w|
        2 * h * l + 2 * l * w + 2 * w * h + h * l
      end.reduce(:+)
    end

    def part_two
      data.map do |h, l, w|
        h + h + l + l + h * l * w
      end.reduce(:+)
    end

    private

    def process_input(line)
      line.split("x").map(&:to_i).sort
    end
  end
end
