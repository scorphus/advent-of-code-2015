# frozen_string_literal: true

module Year2015
  class Day17 < Solution
    TOTAL_EGGNOG = 150

    def part_one
      count_combinations(0, data)
    end

    def part_two
      count_combinations_by_size(0, 0, data).min_by { |size, _| size }.last
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

    def count_combinations_by_size(sum, size, (container, *containers))
      return { size => 1 } if sum == TOTAL_EGGNOG
      return {} if sum > TOTAL_EGGNOG || container.nil?

      count_combinations_by_size(sum, size, containers).merge(
        count_combinations_by_size(sum + container, size + 1, containers)
      ) { |_, x, y| x + y }
    end
  end
end
