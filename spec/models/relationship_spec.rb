require 'spec_helper'

describe Relationship do
	describe "interface" do
		it "should respond to instance variables" do
			should respond_to(:webpage_id)
			should respond_to(:keyword_id)
			should respond_to(:significance)
		end

		it "should respond to association variables" do
			should respond_to(:webpage) # has_many
			should respond_to(:keyword) # has_many
		end
	end
end
