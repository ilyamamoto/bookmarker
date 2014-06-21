require 'spec_helper'

describe Webpage do
	describe "interface" do
		let(:webpage) { FactoryGirl.build(:webpage_only_with_url) }
		subject { webpage }
		
		describe "response" do
			it "should respond to instance accessors" do
				should respond_to(:url)
				should respond_to(:title)
				should respond_to(:html)
				should respond_to(:content)
			end

			it "should respond to instance methods" do
				should respond_to(:fetch)
				should respond_to(:get_content)
				should respond_to(:analyze_morpheme)
				should respond_to(:analyze_tfidf)
				should respond_to(:analyze_kakariuke)
				should respond_to(:get_keywords)
				should respond_to(:score_keywords)
				should respond_to(:save_keywords)
				should respond_to(:save_relationships)
			end

			it "should respond to association methods" do
				should respond_to(:relationships) # has_many
				should respond_to(:keywords)			# has_many through
			end
		end

		describe "validation" do
			# ok even if other instance variables nil or blank
			it { should be_valid }

			describe "when url is blank" do
				before { webpage.url = " " }
				it { should_not be_valid }
			end

			describe "when having invalid url" do
				before { webpage.url = "example.com" }
				it { should_not be_valid }
			end

			describe "when HTTP access failed" do
				before { webpage.fetch }
				#it { should be_valid, unless: false }
			end
		end
	end

	describe "CRUD check" do
		let(:webpage) { FactoryGirl.build(:webpage) }

		describe "create record" do
			specify { expect{ webpage.save }.not_to raise_error } 
		end

		describe "read record" do
			before { webpage.save }
			specify do
				id = webpage.id
				expect{ Webpage.find(id) }.not_to raise_error
			end
		end

		describe "delete record" do
			before { webpage.save }
			specify do
				id = webpage.id
				expect{ Webpage.find(id).destroy }.not_to raise_error
			end
		end
	end

	describe "instance methods" do
		#let(:webpage) { FactoryGirl.build(:webpage_only_with_url) } # not working cause FactoryGirl executes no callbacks 
		let(:webpage) { Webpage.new(url: "http://example.com") }
		
		describe "#fill_from_url (after_initialize)" do
			it "should get :html, :title, :content filled" do
				expect(webpage.html).not_to be_blank
				expect(webpage.title).not_to be_blank
				expect(webpage.content).not_to be_blank
			end
		end

		describe "save" do

		end

		describe "save_keywords" do

		end

		describe "save_relationships" do

		end

	end
end
