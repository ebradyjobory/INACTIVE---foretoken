class Datum < ActiveRecord::Base
	has_many :forecasts
	belongs_to :project
end
