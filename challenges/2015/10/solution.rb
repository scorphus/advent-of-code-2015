# frozen_string_literal: true

module Year2015
  class Day10 < Solution
    def part_one
      look_and_say_all_the_way(data, 40).length
    end

    def part_two
      look_and_say_all_the_way(data, 50).length
    end

    private

    def look_and_say_all_the_way(digits, n)
      (1..n).reduce(digits) do |digits, _|
        look_and_say(digits)
      end
    end

    def look_and_say(digits)
      digits.chars.chunk(&:to_s).map do |char, chars|
        "#{chars.size}#{char}"
      end.join
    end
  end
end
