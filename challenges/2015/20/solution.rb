# frozen_string_literal: true

module Year2015
  class Day20 < Solution
    def part_one
      house = 0
      steps = 2 * 10.pow([0, Math.log10(data).to_i - 6].max)
      loop do
        break if 10 * divisors(house).sum > data

        house += steps
      end
      house
    end

    def part_two
      house = 0
      steps = 2 * 10.pow([0, Math.log10(data).to_i - 6].max)
      loop do
        break if 11 * divisors_slice(house, 50).sum > data

        house += steps
      end
      house
    end

    private

    def process_input(line)
      line.to_i
    end

    def divisors(n)
      (1..Math.sqrt(n).to_i).reduce(Set.new) do |divisors, d|
        (divisors << d << n / d if n % d == 0) || divisors
      end
    end

    def divisors_slice(n, m)
      (1..Math.sqrt(n).to_i).each_with_object(Set.new) do |d, divisors|
        next unless n % d == 0

        divisors << d if n / d <= m
        divisors << n / d if d <= m
        divisors
      end
    end
  end
end
