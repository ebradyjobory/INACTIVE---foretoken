class Future < ActiveRecord::Base

	def self.years
		future_years = []
		futures = Future.all
		futures.each do |i|
			future_years << i.forcasted
		end
		future_years	
	end


	def mean
		forecasts = Forecast.all
		revenues = []

		forecasts.each do |i|
			revenues << i.revenue
		end		
		
		sum = 0
		revenues.each { |i| sum += i }	
		mean = sum / revenues.length
	end

	def tbar
		sum = 0
		ids = []
		total = 0
		forecasts = Forecast.all		
		forecasts.each do |i|
			ids << i.id
		end
		ids.each do |k|
			sum += k
		end	
		tbar = sum / ids.length
	end

	def b1
		sum1 = 0
		sum2 = 0
		forecasts = Forecast.all
		forecasts.each do |i|
			sum1 += (i.xxbar_ttbar)
			sum2 += (i.ttbar_sq)
		end
		sum1 / sum2
	end

	def b0
		mean  - (b1 * tbar)
	end


	def last_entry_year
		forecasts = Forecast.all
		last_entry = forecasts.last
		last_entry_year = last_entry.year
	end	

	def last_entry_year_id
		forecasts = Forecast.all
		last_entry = forecasts.last
		last_entry_year_id = last_entry.id	
	end

	def time
			futures = Future.all
			years_diff = future_year - last_entry_year
			id = last_entry_year_id + years_diff
			time = id
	end

	def forcasted
		b0 + (b1 * time)
	end

	





end
