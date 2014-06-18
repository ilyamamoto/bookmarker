require 'spec_helper'

describe Page do
	before do
		@page = Page.new(url: "http://example.com")
	end

	subject { @page }

	# instance vars
	it { should respond_to(:url) }

	# instance methods
	it { should respond_to(:fetch) }
	it { should respond_to(:dissect) }
	

end
