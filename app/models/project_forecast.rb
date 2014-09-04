class ProjectForecast < ActiveRecord::Base
	belongs_to :project 
	has_many :forecasts
end
