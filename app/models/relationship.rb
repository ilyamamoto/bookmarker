class Relationship < ActiveRecord::Base
	belongs_to :webpage
	belongs_to :keyword
end
