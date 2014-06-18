require 'spec_helper'

describe Page do
	let(:ipage) { FactoryGirl.create(:page) }

	subject { ipage }

	describe "interface" do
		# instance vars
		it { should respond_to(:url) }

		# instance methods
		it { should respond_to(:fetch) }
		it { should respond_to(:dissect) }
	end	

	describe "#fetch" do
		specify do
			html = ipage.fetch
			expect(html).to match(/^<\!DOCTYPE>/)
		end
	end

	describe "#dissect" do

	end
end
