# frozen_string_literal: true

module Year2015
  class Day08 < Solution
    def part_one
      data.reduce(0) do |sum, literal|
        # rubocop:disable Security/Eval
        sum + literal.length - eval(literal).length
        # rubocop:enable Security/Eval
      end
    end

    def part_two
      data.reduce(0) do |sum, literal|
        sum + literal.dump.length - literal.length
      end
    end
  end
end
