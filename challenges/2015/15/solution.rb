# frozen_string_literal: true

module Year2015
  class Day15 < Solution
    TEASPOONS = 100
    IDEAL_CALORIES = 500

    def part_one
      all_permutations(TEASPOONS).map do |perm|
        props = Array.new(data[0].size - 1, 0)
        perm.each_with_index do |quantity, i|
          data[i][..-2].each_with_index do |prop, j|
            props[j] += quantity * prop
          end
        end
        props.map { |prop| [0, prop].max }.reduce(:*)
      end.max
    end

    def part_two
      all_permutations(TEASPOONS).map do |perm|
        calories = 0
        props = Array.new(data[0].size - 1, 0)
        perm.each_with_index do |quantity, i|
          calories += quantity * data[i][-1]
          data[i][..-2].each_with_index do |prop, j|
            props[j] += quantity * prop
          end
        end
        calories == IDEAL_CALORIES ? props.map { |prop| [0, prop].max }.reduce(:*) : 0
      end.max
    end

    private

    def process_input(line)
      line.scan(/[-\d]+/).map(&:to_i)
    end

    def all_permutations(quantity)
      (0..quantity).to_a.repeated_permutation(data.size).filter do |perm|
        perm.sum == quantity
      end
    end
  end
end
