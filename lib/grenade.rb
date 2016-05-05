require_relative 'weapon'

class Grenade < Weapon

	attr_reader :range
	
	def initialize(name="Grenade", weight=40, damage=15)
		super
		@range = 2
	end

end 