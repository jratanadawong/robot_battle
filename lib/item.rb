class Item

	attr_reader :name, :weight, :damage
	
	def initialize(name, weight, damage=0)
		@name = name
		@weight = weight
		@damage = damage
	end

end 