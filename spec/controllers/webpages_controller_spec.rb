require 'spec_helper'

describe WebpagesController do
	subject { page }

	shared_examples "available" do |args|
		before { get args }
		
		it "responds successfully with an HTTP 200 status code" do
			expect(response).to be_success
			expect(response.status).to eq 200
		end

		it "renders the template" do
			expect(response).to render_template(args)
		end
	end

	describe "GET #index" do
		it_should_behave_like "available", :index
	end

	describe "GET #show" do
		pending { it_should_behave_like "available", :show, 2 }
	end

	describe "GET #new" do
		before { get :new }
		specify { expect(response.status).to eq 200 }
	end

	describe "GET #create" do
		before { get :create }
	end
end
