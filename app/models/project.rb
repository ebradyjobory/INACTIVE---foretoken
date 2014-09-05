class Project < ActiveRecord::Base
	has_many :forecasts
	has_many :futures
	belongs_to :user
end
