require 'spec_helper'

describe PagesController do
	subject { page }

	describe "#new" do
		before do
			visit new_page_path
		end
		it "should have elements needed" do
			should have_title( 'Add New Page' )
			should have_button( 'Add' )
		end
	end
end
