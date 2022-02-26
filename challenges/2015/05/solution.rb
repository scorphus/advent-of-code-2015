# frozen_string_literal: true

require "set"

module Year2015
  class Day05 < Solution
    def part_one
      data.map do |line|
        nice?(line) ? 1 : 0
      end.reduce(:+)
    end

    def part_two
      data.map do |line|
        nicer?(line) ? 1 : 0
      end.reduce(:+)
    end

    private

    def initialize(input)
      super
      @vowels = Set["a".ord, "e".ord, "i".ord, "o".ord, "u".ord]
      @offenders = Set["b".ord, "d".ord, "q".ord, "y".ord]
    end

    def nice?(line)
      vowels_count = 0
      dupes = false
      prev = -1
      line.split("").map(&:ord).each do |curr|
        return false if @offenders.include?(curr) && curr - prev == 1

        vowels_count += 1 if @vowels.include?(curr)
        dupes = true if curr == prev
        prev = curr
      end
      (vowels_count >= 3) && dupes
    end

    def nicer?(line)
      pair = letter = false
      prev_prev = prev = -1
      indexes = {}
      line.split("").map(&:ord).each_with_index do |curr, i|
        pair, indexes = check_pair(prev, curr, i, indexes) unless pair
        letter = true if curr == prev_prev
        prev_prev = prev
        prev = curr
        break if pair && letter
      end
      pair && letter
    end

    def check_pair(prev, curr, index, indexes)
      if indexes.key?([curr, prev])
        [indexes[[curr, prev]] < index - 1, indexes]
      else
        [false, indexes.merge({ [curr, prev] => index })]
      end
    end
  end
end
