# frozen_string_literal: true

module Year2015
  class Day25 < Solution
    def part_one
      row, col = data.scan(/\d+/).map(&:to_i)
      size = row + col - 1
      triangle = size * (size + 1) / 2 # https://oeis.org/A000217
      (triangle - row).times.reduce(20151125) do |code, _i|
        code * 252533 % 33554393
      end
    end

    def part_two
      <<~EOF
        You have enough stars to start the weather machine.
        You fill the weather machine with fifty stars. It comes to life!
        Snow begins to fall.
      EOF
    end
  end
end
