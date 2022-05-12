# frozen_string_literal: true

require "fc"

module Year2015
  SPELLS = {
    magic_missile: { cost: 53, damage: 4, armor: 0, heal: 0, mana: 0, turns: 1, effect: false },
    drain: { cost: 73, damage: 2, armor: 0, heal: 2, mana: 0, turns: 1, effect: false },
    shield: { cost: 113, damage: 0, armor: 7, heal: 0, mana: 0, turns: 6, effect: true },
    poison: { cost: 173, damage: 3, armor: 0, heal: 0, mana: 0, turns: 6, effect: true },
    recharge: { cost: 229, damage: 0, armor: 0, heal: 0, mana: 101, turns: 5, effect: true },
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
    def initialize(hit_points, mana)
      super(hit_points, 0)
      @mana = mana
      @spent = 0
    end
    attr_reader :mana, :spent

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
      @spent += amount
    end
  end

  class Game
    def initialize(p1, p2, hard_mode = false)
      @p1 = p1
      @p2 = p2
      @hard_mode = hard_mode
    end

    def play_until_p1_wins
      queue = FastContainers::PriorityQueue.new(:min)
      queue.push([@p1, @p2, {}], 0) # [player, opponent, spells]
      until queue.empty?
        p1, p2, spells = queue.pop
        if @hard_mode
          p1.get_hit(1)
          next unless p1.alive?
        end
        damage, _armor, mana, spells = apply_effects(spells)
        p1.gain(mana)
        p2.get_hit(damage) if damage > 0
        SPELLS.each do |name, spell|
          cost = spell[:cost]
          next if !p1.can_afford?(cost) || spells[name]

          new_p1 = p1.dup
          new_p2 = p2.dup
          new_p1.spend(cost)
          damage, heal = cast_spell(name)
          new_p1.heal(heal)
          new_p2.get_hit(damage) if damage > 0
          new_spells = spells.merge({ name => spell[:turns] })
          damage, armor, mana, new_spells = apply_effects(new_spells)
          new_p1.gain(mana)
          new_p2.get_hit(damage) if damage > 0
          return new_p1.spent unless new_p2.alive?

          new_p1.get_hit(new_p2.damage - armor)
          queue.push([new_p1, new_p2, new_spells], new_p1.spent) if new_p1.alive?
        end
      end
    end

    def cast_spell(name)
      SPELLS[name][:effect] ? [0, 0] : [SPELLS[name][:damage], SPELLS[name][:heal]]
    end

    def apply_effects(spells)
      spells.select { |name, _turns| SPELLS[name][:effect] }
        .reduce([0, 0, 0, {}]) do |(damage, armor, mana, spells), (name, turns)|
        [damage + SPELLS[name][:damage],
         armor + SPELLS[name][:armor],
         mana + SPELLS[name][:mana],
         turns > 1 ? spells.merge({ name => turns - 1 }) : spells,]
      end
    end
  end

  class Day22 < Solution
    def part_one
      Game.new(Wizard.new(50, 500), Player.new(*data)).play_until_p1_wins
    end

    def part_two
      Game.new(Wizard.new(50, 500), Player.new(*data), true).play_until_p1_wins
    end

    private

    def process_input(line)
      line.split(": ").last.to_i
    end
  end
end
