class Keyword < ActiveRecord::Base
	has_many :relationships, dependent: :destroy
	has_many :webpages, through: :relationships, order: 'relationships.significance DESC'
end
