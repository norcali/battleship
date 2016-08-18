class Unit < ActiveRecord::Base
  attr_accessible :attacked, :board, :ship, :position
  belongs_to :board
  belongs_to :ship

  def last_of_row?
  	id % 10 == 9
  end

  def first_of_row?
  	id % 10 == 0
  end

  def occupied?
  	!ship.nil?
  end
end