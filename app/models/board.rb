class Board < ActiveRecord::Base
  attr_accessible :user, :units
  belongs_to :user
  has_many :units, dependent: :destroy
  after_create :create_board, :assign_positions, :random_ship_assignment

  SHIPS = [5,4,4,3,2,2,1,1]

  def create_board
  	unit = {board: self}
			100.times do
				Unit.create unit
			end
  end

  def assign_positions
  	units.each_with_index do |unit, index|
				unit.update_attributes({position: index})
			end
  end

  def random_ship_assignment
  	SHIPS.each do |ship|
  		@sucess = false
  		until @sucess
  			position = rand(99)
  			unit = units.at(position)
  			array = []
  			array << horizontal_assignment(unit, ship)
  			array << vertical_assignment(unit, ship)
  			@sucess = array.any?{|arr| !arr.empty?}
  		end
  		params = {length: ship, units: array.find {|arr| !arr.empty?}}
  		Ship.create params
  	end
  end

  def horizontal_assignment(unit, number)
  	results = []
 		position = unit.position
 		next_number_units = position + number - 1
 		if next_number_units <= 99
	 		array = units[position .. next_number_units]
	 		results = array if array.all?{|unit| !unit.last_of_row? && !unit.occupied? }
	 	end
 		return results 
  end

  def vertical_assignment(unit, number)
  	position = unit.position
  	results = []
  	if (position + ((number - 1)*10)) <= 99
  		array = []
	  	number.times do |l|
	  		next_down = l * 10
	  		array << units.at(position + next_down)
	  	end
	  	results = array if array.all?{|unit| !unit.last_of_row? && !unit.occupied? }
	  end
	  return results
  end
end
