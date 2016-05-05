require_relative 'item'

class Weapon < Item

	attr_reader :range
	
	def initialize(name, weight, damage=45)
		super
		@damage = damage
		@range = 1
	end

	def hit(target)
		target.wound(damage)
	end

end 