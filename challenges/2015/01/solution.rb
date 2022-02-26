# frozen_string_literal: true

module Year2015
  class Day01 < Solution
    def part_one
      floor = 0
      data.split("").each do |c|
        if c == "("
          floor += 1
        else
          floor -= 1
        end
      end
      floor
    end

    def part_two
      floor = 0
      data.split("").each_with_index do |c, i|
        if c == "("
          floor += 1
        else
          floor -= 1
        end
        return i + 1 if floor == -1
      end
      nil
    end
  end
end
