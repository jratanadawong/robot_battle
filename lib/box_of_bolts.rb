require_relative 'Item'

class BoxOfBolts < Item
	
	def initialize(name="Box of bolts", weight=25)
		super
	end

	def feed(target)
		target.heal(20)
	end

end 