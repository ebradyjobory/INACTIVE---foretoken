class Forecast < ActiveRecord::Base

	def self.total_revenues
		actual_revenues = []
	    forecasted_revenues = []

		actuals = Forecast.all
		actuals.each do |i|
			actual_revenues << i.revenue
		end
		forecasted = Future.all
		forecasted.each do |i|
			forecasted_revenues << i.forcasted
		end
		total_revenues = actual_revenues + forecasted_revenues
	end

	def self.total_years
		years = []
		future_years = []
		forecasts = Forecast.all
		forecasts.each do |i|
			years << i.year
		end
		futures = Future.all
		futures.each do |j|
			future_years << j.future_year
		end
		total_years = years + future_years
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

	def xxbar
		revenue.to_f - mean.to_f
	end

	def time
		id
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

	def ttbar
		id - tbar
	end

	def xxbar_ttbar
		xxbar * ttbar
	end

	def ttbar_sq
		(ttbar.abs)**2	
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
		mean  - (b1*tbar)
	end

	def xhat
	    b0 + (b1 * time)
	end

	def x_xhatsq
		(revenue - xhat)**2
	end

	def xhat_xbarsq
		(xhat - mean)**2	
	end

	def x_xbarsq
		(revenue - mean)**2	
	end












	# def t_tbar
	# end


    # sum = 0 
    # t.each do |i|
    #   sum += i
    # end 
    # tmean = sum / t.length
    # t.each do |i|

    # end
		

	# end
	# def x_xbar
	# 	revenue - mean
	# end

	# def total
	# 	total = 0
	# 	forecasts = Forecast.all
	# 	revenue = forecasts.revenue
	# 	total += revenue
	# end

	# def sum
	# 	forecast.map do |i| i.total end
	# end

	# def mult
	# 	year * revenue
		# sum = 0
		# i = 0
		# revenues_array = []

		# forecast = Forecast.all
		# forecast.each do |r|
		# 	revenue = r.revenue
		# 	revenues_array << revenue
		# end
		# revenues_array.each do |r|
		# 	if i < revenues_array.length
		# 		sum += r
		# 		i += 1
		# 	end
		# 	mean = sum / revenues_array.length
		# end
		# mean  	
	# end
		
	









end
