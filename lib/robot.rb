require_relative 'item'
require_relative 'weapon'
require_relative 'laser'
require_relative 'plasma_cannon'
require_relative 'you_are_dead_error'
require_relative 'not_a_robot_error'
require_relative 'Box_of_Bolts'

class Robot

	attr_reader :position, :items, :items_weight, :capacity, :health, :damage 
	attr_accessor :equipped_weapon

	# @@default_health = 100

	def initialize(position=[0,0], items=[], damage=5)
		@position = position
		@items = items
		@health = 100
		@items_weight = 0
		@capacity = 250
		@damage = damage
		@equipped_weapon = nil
	end

	def move_left
		@position[0]-=1
	end

	def move_right
		@position[0]+=1
	end

	def move_down
		@position[1]-=1
	end

	def move_up
		@position[1]+=1
	end

	def pick_up(item)
		return false if items_weight + item.weight > capacity
		@items_weight += item.weight
		items << item
		auto_equip(item)
		auto_heal(item)
		true
		# MM
		# if items_weight + item.weight > capacity
		# 	false
		# else
		# 	@items_weight += item.weight
		# 	items << item
		# 	auto_equip(item)
		# 	true
		# end
	end

	def auto_heal(item)
		return false unless item.is_a?(BoxOfBolts)
		return false if health > 80
		item.feed(self)
	end

	def auto_equip(item)
		return false unless equipped_weapon.nil?
		return false unless item.is_a?(Weapon)
		@equipped_weapon = item
	end

	def wound(damage)
		@health -= damage
		@health = 0 if @health < 0
	end

	def heal(amount)
		heal!
		@health += amount
		@health = 100 if @health > 100
	end

	def attack!(target)
		raise NotARobotError unless target.is_a?(Robot)
	end

	def heal!
		raise YouAreDeadError if @health <=0
	end

	def legal_attack?(target)
		if equipped_weapon
			return false unless target.position[0].between?(@position[0]-(1+equipped_weapon.range),@position[0]+(equipped_weapon.range))
			return false unless target.position[1].between?(position[1]-(1+equipped_weapon.range),position[1]+(equipped_weapon.range))
		else
			return false unless target.position[0].between?(@position[0]-1, @position[0]+1)
			return false unless target.position[1].between?(@position[1]-1, @position[1]+1)
		end
		true
	end

	def attack(target)
		attack!(target)
		return false unless legal_attack?(target)
		target.wound(damage) if equipped_weapon.nil?
		equipped_weapon.hit(target) if equipped_weapon
		@equipped_weapon = nil if equipped_weapon.is_a?(Grenade)

		# MM
		# if equipped_weapon.nil?
		# 	target.wound(damage) 
		# else
		# 	equipped_weapon.hit(target) 
		# end
	end

end
