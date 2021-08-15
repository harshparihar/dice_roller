class User < ApplicationRecord

  has_many :turns, dependent: :destroy
  has_many :rolls, through: :turns

  HAS_DICE_OF_FACES = [6, 8, 10, 20, 30, 50]
  MAX_DICE_ALLOWED_TO_ROLL = 3

  def self.generate_intial_users
    ["A", "B"].each{|name| User.create!({name: name}) }
  end


  def self.start_game(number)
    User.destroy_all
    generate_intial_users

    number.times do
      User.find_each do |user|
        number_of_dice_allowed = rand(1..User::MAX_DICE_ALLOWED_TO_ROLL)
        dices_for_rolls = User::HAS_DICE_OF_FACES.sample(number_of_dice_allowed)

        value_from_rolls = user.roll_dice(dices_for_rolls)
        user.roll_value += value_from_rolls
        user.save!
      end
    end
  end

  def roll_dice(dices_for_rolls)
    turn = self.turns.create!
    value_from_rolls = 0
    dices_for_rolls.each do |dice_side|
      value_for_this_roll = rand(1..dice_side)
      value_from_rolls += value_for_this_roll
      turn.rolls.create!({
        dice_sides: dice_side,
        roll_value: value_for_this_roll
      })
    end
    value_from_rolls
  end

end
