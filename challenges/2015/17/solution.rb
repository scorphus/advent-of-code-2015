# frozen_string_literal: true

module Year2015
  class Day17 < Solution
    TOTAL_EGGNOG = 150

    def part_one
      count_combinations(0, data)
    end

    def part_two
      nil
    end

    private

    def process_dataset(set)
      set.map(&:to_i)
    end

    def count_combinations(sum, (container, *containers))
      return 1 if sum == TOTAL_EGGNOG
      return 0 if sum > TOTAL_EGGNOG || container.nil?
      count_combinations(sum, containers) + count_combinations(sum + container, containers)
    end
  end
end
