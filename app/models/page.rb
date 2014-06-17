class Page < ActiveRecord::Base
	validates :url, presence: true
end
