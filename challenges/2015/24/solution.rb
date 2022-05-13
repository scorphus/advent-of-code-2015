# frozen_string_literal: true

module Year2015
  class Day24 < Solution
    def hang_in_balance(packages)
      group_weight = packages.sum / 3
      (1..packages.size - 1)
        .reduce([Float::INFINITY, Float::INFINITY]) do |(min_qe, min_size), size|
          packages.combination(size).each do |combination|
            next unless combination.sum == group_weight

            qe = combination.inject(:*)
            if size <= min_size && qe <= min_qe
              min_qe = qe
              min_size = size
            end
          end
          return min_qe if min_qe < Float::INFINITY

          [min_qe, min_size]
        end
    end

    def part_one
      hang_in_balance(data)
    end

    def part_two
      nil
    end

    private

    def process_input(line)
      line.to_i
    end
  end
end
