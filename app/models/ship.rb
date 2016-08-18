class Ship < ActiveRecord::Base
  attr_accessible :length, :status, :units
  has_many :units
end
