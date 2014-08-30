class Forecast < ActiveRecord::Base

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
