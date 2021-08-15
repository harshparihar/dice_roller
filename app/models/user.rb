class User < ApplicationRecord

  def self.generate_intial_users
    ["A", "B"].each{|name| User.create!({name: name}) }
  end
end
