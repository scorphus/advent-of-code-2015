# frozen_string_literal: true

module Year2015
  class Day21 < Solution
    def initialize(input)
      super
      @weapons = [
        { cost: 8, damage: 4, armor: 0 },
        { cost: 10, damage: 5, armor: 0 },
        { cost: 25, damage: 6, armor: 0 },
        { cost: 40, damage: 7, armor: 0 },
        { cost: 74, damage: 8, armor: 0 },
      ]

      @armor = [
        { cost: 13, damage: 0, armor: 1 },
        { cost: 31, damage: 0, armor: 2 },
        { cost: 53, damage: 0, armor: 3 },
        { cost: 75, damage: 0, armor: 4 },
        { cost: 102, damage: 0, armor: 5 },
        { cost: 0, damage: 0, armor: 0 },
      ]

      @rings = [
        { cost: 25, damage: 1, armor: 0 },
        { cost: 50, damage: 2, armor: 0 },
        { cost: 100, damage: 3, armor: 0 },
        { cost: 20, damage: 0, armor: 1 },
        { cost: 40, damage: 0, armor: 2 },
        { cost: 80, damage: 0, armor: 3 },
        { cost: 0, damage: 0, armor: 0 },
        { cost: 0, damage: 0, armor: 0 },
      ]

      @hit_points = 100
    end

    def part_one
      @weapons.product(@armor).reduce(Float::INFINITY) do |min_cost, (weapon, armor)|
        @rings.combination(2).each do |ring1, ring2|
          dmg = weapon[:damage] + ring1[:damage] + ring2[:damage]
          arm = armor[:armor] + ring1[:armor] + ring2[:armor]
          next unless p1_wins?([@hit_points, dmg, arm], data)

          min_cost = [min_cost, weapon[:cost] + armor[:cost] + ring1[:cost] + ring2[:cost]].min
        end
        min_cost
      end
    end

    def part_two
      @weapons.product(@armor).reduce(0) do |max_cost, (weapon, armor)|
        @rings.combination(2).each do |ring1, ring2|
          dmg = weapon[:damage] + ring1[:damage] + ring2[:damage]
          arm = armor[:armor] + ring1[:armor] + ring2[:armor]
          next if p1_wins?([@hit_points, dmg, arm], data)

          max_cost = [max_cost, weapon[:cost] + armor[:cost] + ring1[:cost] + ring2[:cost]].max
        end
        max_cost
      end
    end

    private

    def process_input(line)
      line.split(": ").last.to_i
    end

    def p1_wins?((p1_hps, p1_dmg, p1_arm), (p2_hps, p2_dmg, p2_arm))
      p1_rounds = (p1_hps.to_f / [1, p2_dmg - p1_arm].max).ceil
      p2_rounds = (p2_hps.to_f / [1, p1_dmg - p2_arm].max).ceil
      p1_rounds >= p2_rounds
    end
  end
end
