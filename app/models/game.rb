class Game < ActiveRecord::Base
  attr_accessible :score_1, :score_2, :ships_1, :ships_2, :turns_1, :turns_2, :finished, :id
  has_many :users
end
