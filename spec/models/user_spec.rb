require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Start game" do
    context "initialize users" do
      it "should have 2 users" do
        User.generate_intial_users
        expect(User.count).to eq(2)
      end
    end

    context "when dices are rolled for users" do
      it "should have total roll value count equal to dice rolls value" do
        User.start_game(rand(1..5))

        user1 = User.first
        user2 = User.last

        expect(user1.roll_value).to eq(user1.rolls.sum(:roll_value))
        expect(user2.roll_value).to eq(user2.rolls.sum(:roll_value))
      end
    end
  end

end
