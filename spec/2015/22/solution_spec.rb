# frozen_string_literal: true

require "spec_helper"

RSpec.describe(Year2015::Player) do
  let(:player) { described_class.new(10, 5) }

  it "is initialized with hit_points, armor and damage" do
    expect(player.hit_points).to(eq(10))
    expect(player.damage).to(eq(5))
  end

  it "is alive if hit_points > 0" do
    expect(player.alive?).to(eq(true))
  end

  it "is not alive if hit_points <= 0" do
    player = described_class.new(0, 5)
    expect(player.alive?).to(eq(false))
  end

  it "gets hit with damage" do
    player.get_hit(5)
    expect(player.hit_points).to(eq(5))
  end

  it "gets hit with negative damage and loses 1 hit point" do
    player.get_hit(-5)
    expect(player.hit_points).to(eq(9))
  end

  it "can be duplicated" do
    player2 = player.dup
    player.get_hit(5)
    expect(player2.hit_points).to(eq(10))
  end
end

RSpec.describe(Year2015::Wizard) do
  let(:wizard) { described_class.new(10, 100) }

  it "is initialized with hit_points, damage and mana" do
    expect(wizard.hit_points).to(eq(10))
    expect(wizard.damage).to(eq(0))
    expect(wizard.mana).to(eq(100))
  end

  it "can afford an amount of mana" do
    expect(wizard.can_afford?(5)).to(eq(true))
  end

  it "can not afford an amount of mana" do
    expect(wizard.can_afford?(101)).to(eq(false))
  end

  it "can be healed" do
    wizard.heal(5)
    expect(wizard.hit_points).to(eq(15))
  end

  it "can gain mana" do
    wizard.gain(5)
    expect(wizard.mana).to(eq(105))
  end

  it "can spend mana" do
    wizard.spend(5)
    expect(wizard.mana).to(eq(95))
    expect(wizard.spent).to(eq(5))
  end
end

RSpec.describe(Year2015::Game) do
  let(:game) { Year2015::Game.new(nil, nil) }

  describe "cast_spell" do
    it "returns 0 damage and 0 heal when effect" do
      expect(game.cast_spell(:poison)).to(eq([0, 0]))
    end

    it "returns 4 damage and 0 heal when magic_missile" do
      expect(game.cast_spell(:magic_missile)).to(eq([4, 0]))
    end

    it "returns 2 damage and 2 heal when drain" do
      expect(game.cast_spell(:drain)).to(eq([2, 2]))
    end
  end

  describe "apply_effects" do
    it "returns empty effects if none applied" do
      expect(game.apply_effects({})).to(eq([0, 0, 0, {}]))
    end

    it "returns empty effects if all of them wear off" do
      expect(game.apply_effects({
        magic_missile: 1,
        drain: 1,
        shield: 1,
        poison: 1,
        recharge: 1,
      })).to(eq([3, 7, 101, {}]))
    end

    it "applies all and return remaining when all effects were just cast" do
      expect(game.apply_effects({
        magic_missile: 1,
        drain: 1,
        shield: 6,
        poison: 6,
        recharge: 5,
      })).to(eq([3, 7, 101, {
        shield: 5,
        poison: 5,
        recharge: 4,
      },]))
    end

    it "returns effects with remaining ones" do
      expect(game.apply_effects({
        magic_missile: 1,
        drain: 1,
        shield: 1,
        poison: 1,
        recharge: 2,
      })).to(eq([3, 7, 101, {
        recharge: 1,
      },]))
    end

    it "wears effects of 1 turn" do
      expect(game.apply_effects({
        shield: 5,
        poison: 5,
        recharge: 4,
      })).to(eq([3, 7, 101, {
        shield: 4,
        poison: 4,
        recharge: 3,
      },]))
    end
  end
end

RSpec.describe(Year2015::Day22) do
  let(:input) { File.read(File.join(File.dirname(__FILE__), "../../../challenges/2015/22/input.txt")) }

  describe "part 1" do
    it "finds 900 as the least amount of mana I can spend and still win the fight" do
      expect(described_class.part_one(input)).to(eq(900))
    end
  end

  describe "part 2" do
    it "returns nil for my input" do
      expect(described_class.part_two(input)).to(eq(nil))
    end
  end
end
