class Project < ActiveRecord::Base
	has_many :forecasts
	belongs_to :user
end
