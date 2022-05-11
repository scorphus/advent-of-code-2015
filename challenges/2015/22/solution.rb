# frozen_string_literal: true

require "fc"

module Year2015
  SPELLS = {
    magic_missile: { cost: 53, damage: 4, armor: 0, heal: 0, mana: 0, turns: 1 },
    drain: { cost: 73, damage: 2, armor: 0, heal: 2, mana: 0, turns: 1 },
    shield: { cost: 113, damage: 0, armor: 7, heal: 0, mana: 0, turns: 6 },
    poison: { cost: 173, damage: 3, armor: 0, heal: 0, mana: 0, turns: 6 },
    recharge: { cost: 229, damage: 0, armor: 0, heal: 0, mana: 101, turns: 5 },
  }.freeze

  class Player
    def initialize(hit_points, damage)
      @hit_points = hit_points
      @damage = damage
    end
    attr_reader :hit_points, :damage

    def alive?
      @hit_points > 0
    end

    def get_hit(amount)
      @hit_points -= [amount, 1].max
    end
  end

  class Wizard < Player
    def initialize(hit_points, damage, mana)
      super(hit_points, damage)
      @mana = mana
    end
    attr_reader :mana

    def can_afford?(amount)
      @mana >= amount
    end

    def heal(amount)
      @hit_points += amount
    end

    def gain(amount)
      @mana += amount
    end

    def spend(amount)
      @mana -= amount
    end
  end

  class Game
    def initialize(p1, p2)
      @p1 = p1
      @p2 = p2
    end

    def play_until_p1_wins
      start = [@p1, @p2, {}] # [player, opponent, effects]
      queue = FastContainers::PriorityQueue.new(:min)
      queue.push(start, 0)
      until queue.empty?
        spent = queue.top_key
        p1, p2, effects = queue.pop
        damage, _armor, heal, mana, effects = run_effects(effects)
        p1.heal(heal)
        p1.gain(mana)
        p2.get_hit(damage)
        SPELLS.keys.each do |spell|
          cost = SPELLS[spell][:cost]
          next if effects[spell] || !p1.can_afford?(cost)

          new_p1 = p1.dup
          new_p2 = p2.dup
          new_effects = effects.dup.merge({ spell => SPELLS[spell][:turns] })
          damage, armor, heal, mana, new_effects = run_effects(new_effects)
          new_p2.get_hit(damage)
          new_p1.spend(cost)
          new_p1.heal(heal)
          new_p1.gain(mana)
          new_p1.get_hit(new_p2.damage - armor)
          queue.push([new_p1, new_p2, new_effects], spent + cost) if new_p1.alive?
          return spent + cost unless new_p2.alive?
        end
      end
    end

    def run_effects(effects)
      effects.reduce([0, 0, 0, 0, {}]) do |(damage, armor, heal, mana, effects), (spell, turns)|
        [damage + SPELLS[spell][:damage],
         armor + SPELLS[spell][:armor],
         heal + SPELLS[spell][:heal],
         mana + SPELLS[spell][:mana],
         turns > 1 ? effects.merge({ spell => turns - 1 }) : effects,]
      end
    end
  end

  class Day22 < Solution
    def part_one
      Game.new(Wizard.new(50, 0, 500), Player.new(*data))
        .play_until_p1_wins
    end

    def part_two
      nil
    end

    private

    def process_input(line)
      line.split(": ").last.to_i
    end
  end
end
