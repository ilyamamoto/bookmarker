require 'spec_helper'

describe Keyword do

	describe "interface" do
		let(:keyword) { FactoryGirl.create(:keyword) }
		subject { keyword }

		it "should respond to instance variables" do
			should respond_to(:name)	
		end

		it "should respond to association methods" do
			should respond_to(:relationships) # has_many
			should respond_to(:webpages) 			# has_many through
		end
	end
end
