# frozen_string_literal: true

module Year2015
  class Day03 < Solution
    def initialize(input)
      super
      @deltas = {
        '^' => [0, 1],
        'v' => [0, -1],
        '<' => [-1, 0],
        '>' => [1, 0]
      }
    end

    def part_one
      _, _, houses =
        data.reduce([0, 0, { [0, 0] => true }]) do |(x, y, houses), direction|
          dx, dy = @deltas[direction]
          houses[[x + dx, y + dy]] = true
          [x + dx, y + dy, houses]
        end
      houses.size
    end

    def part_two
      _, _, _, _, houses =
        data.each_slice(2).reduce([0, 0, 0, 0, { [0, 0] => true }]) do |memo, obj|
          reduce_input(memo, obj)
        end
      houses.size
    end

    private

    def reduce_input((sx, sy, rx, ry, houses), (sd, rd))
      sdx, sdy = @deltas[sd]
      houses[[sx + sdx, sy + sdy]] = true
      rdx, rdy = @deltas[rd]
      houses[[rx + rdx, ry + rdy]] = true
      [sx + sdx, sy + sdy, rx + rdx, ry + rdy, houses]
    end

    def process_input(line)
      line.split('')
    end
  end
end
