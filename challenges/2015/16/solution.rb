# frozen_string_literal: true

module Year2015
  class Day16 < Solution
    TICKER_TAPE = {
      children: 3,
      cats: 7,
      samoyeds: 2,
      pomeranians: 3,
      akitas: 0,
      vizslas: 0,
      goldfish: 5,
      trees: 3,
      cars: 2,
      perfumes: 1,
    }

    def part_one
      data
      TICKER_TAPE.reduce(@aunts) do |aunts, (k, v)|
        aunts.select do |_, things|
          !things.key?(k) || things[k] == v
        end
      end.keys.first
    end

    def part_two
      data
      TICKER_TAPE.reduce(@aunts) do |aunts, (k, v)|
        aunts.select do |_, things|
          if !things.key?(k)
            true
          elsif k == :cats || k == :trees
            things[k] > v
          elsif k == :pomeranians || k == :goldfish
            things[k] < v
          else
            things[k] == v
          end
        end
      end.keys.first
    end

    private

    def initialize(input)
      super
      @aunts = {}
    end

    def process_input(line)
      line.scan(/Sue (\d+): (.+)/).map do |sue_id, sue_things|
        # rubocop:disable Security/Eval
        @aunts[sue_id.to_i] = eval("{#{sue_things}}")
        # rubocop:enable Security/Eval
      end
    end
  end
end
