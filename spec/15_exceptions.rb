require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end
	describe "YouAreDeadError" do
		it "should raise an error if you attempt to heal but are dead" do
			@robot.wound(100)
			expect{@robot.heal(20)}.to raise_error
		end
	end

	describe "NotARobotError" do
		it "should rause an error if you attempt to attack a non-robot" do
			target = BoxOfBolts.new
			expect{@robot.attack(target)}.to raise_error
		end
	end

end