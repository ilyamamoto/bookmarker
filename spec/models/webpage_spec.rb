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
				should respond_to(:register)
				should respond_to(:analyze)
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
				before { webpage.register }
				#it { should be_valid, unless: false }
				#it should do asynchronous access
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
		describe "#register" do
			let(:webpage) { Webpage.new(url: "http://example.com") }
			it "should get :html, :title, :content filled" do
				expect(webpage.html).not_to be_blank
				expect(webpage.title).not_to be_blank
				expect(webpage.content).not_to be_blank
			end

			it "should save to database" do
				expect do
					Webpage.new(url: "http://example.com")
				end.to change(Webpage, :count).by(1)
			end

			# it "should not execute javascript but omit it from html source code" do end
		end

		describe "#analyze" do
			let!(:webpage) { Webpage.create(url: "http://example.com") }
			before { webpage.analyze }
			it "should save Keyword and Relationship object to database" do
				relationship = Relationship.find_by(webpage_id: webpage.id)
				expect(relationship).not_to be_nil
				expect(Keyword.find_by(id: relationship.keyword.id)).not_to be_nil
				#expect significance not integer but decimal
			end
		end
	end
end
