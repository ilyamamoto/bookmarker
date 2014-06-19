require 'spec_helper'

describe "WebpagesController" do
	subject { page }

	describe "RESTful routing" do
		describe "#new" do
			before { visit new_webpage_path }

			it "should have right view" do
				should have_content('Add Webpage')
				should have_xpath('//input[@id="webpage_url"]')
				should have_button('Add')
			end
		end

		describe "#create" do
			
		end

		describe "#index" do
			before { visit webpages_path }

			it "should have correct content" do
				should have_content( 'Webpages' )
			end

		end

		describe "#show" do

		end

		describe "#delete" do

		end
	end
end
