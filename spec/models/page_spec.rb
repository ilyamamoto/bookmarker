require 'spec_helper'

describe Page do
	before do
		@page = Page.new(url: "http://example.com")
	end

	subject { @page }

	it { should respond_to(:url) }

end
