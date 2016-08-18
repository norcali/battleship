class User < ActiveRecord::Base
  attr_accessible :name, :game_id, :game
  belongs_to :game
  has_one :board
end
