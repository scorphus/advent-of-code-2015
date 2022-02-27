# frozen_string_literal: true

module Year2015
  class Day12 < Solution
    def part_one
      @input.scan(/[-\d]+/).map(&:to_i).reduce(:+) || 0
    end

    def part_two
      zero_out_red(JSON.parse(@input)).flatten.reduce(:+) || 0
    end

    private

    def zero_out_red(json)
      case json
      when Hash
        return [0] if json.value?("red")
        json.values.map { |e| zero_out_red(e) }
      when Array
        json.map { |e| zero_out_red(e) }
      when String
        [0]
      else
        json
      end
    end
  end
end
