# frozen_string_literal: true

module Year2015
  class Day18 < Solution
    GRID_SIZE = 100
    STEPS = 100
    DELTAS = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]]

    def part_one
      (1..STEPS).reduce(@grid) do |grid, _|
        generate_new_grid(grid, count_neighbors(grid))
      end.size
    end

    def part_two
      (1..STEPS).reduce(@grid.merge(defective_lights(GRID_SIZE))) do |grid, _|
        generate_new_grid(grid, count_neighbors(grid)).merge(defective_lights(GRID_SIZE))
      end.size
    end

    private

    def initialize(input)
      super
      @grid = Set.new
      input.split("\n").each_with_index do |line, y|
        line.chars.each_with_index do |char, x|
          @grid << [x, y] if char == "#"
        end
      end
    end

    def count_neighbors(grid)
      grid.each_with_object({}) do |(x, y), neighbors|
        DELTAS.each do |dx, dy|
          next if x + dx < 0 || y + dy < 0 || x + dx >= GRID_SIZE || y + dy >= GRID_SIZE

          neighbors[[x + dx, y + dy]] ||= 0
          neighbors[[x + dx, y + dy]] += 1
        end
        neighbors
      end
    end

    def generate_new_grid(grid, neighbors)
      neighbors.each_with_object(Set.new) do |(pos, count), new_grid|
        new_grid << pos if count == 2 && grid.member?(pos) || count == 3
        new_grid
      end
    end

    def defective_lights(size)
      Set.new([[0, 0], [0, size - 1], [size - 1, 0], [size - 1, size - 1]])
    end
  end
end
