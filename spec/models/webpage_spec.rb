require 'spec_helper'

describe Webpage do
	describe "interface" do
		before { @webpage = Webpage.new( url: "http://exapmle.com" ) } 
		subject { @webpage }
		
		it "should respond to instance accessors" do
			should respond_to(:url)
			should respond_to(:title)
			should respond_to(:html)
			should respond_to(:content)
		end

		it "should respond to instance methods" do
			should respond_to(:fetch)
			should respond_to(:get_content)
			should respond_to(:analyze_morphene)
			should respond_to(:analyze_kakariuke)
			should respond_to(:get_keywords)
			should respond_to(:score_keyword)
		end

		it { should be_valid }

		describe "when url is blank" do
			before { @webpage.url = " " }
			it { should_not be_valid }
		end
	end
end
