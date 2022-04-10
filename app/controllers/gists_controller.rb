require 'date'

class GistsController < ApplicationController
	include GistsHelper

	def index
		gists = HTTParty.get(gists_host + "/gists/public?per_page=100", :verify => false).parsed_response
		@gists = format_gists(gists)
		@order = "asc"
		@orderfield = ""

		if params.has_key?(:orderfield) && params[:orderfield].to_s != ""
			@orderfield = params[:orderfield]

			if params.has_key?(:order) && params[:order].to_s == "desc"
				@order = "desc"
				@gists.sort! do |x,y| y[@orderfield].to_s.downcase  <=> x[@orderfield].to_s.downcase end
			else
				@gists.sort! do |x,y| x[@orderfield].to_s.downcase  <=> y[@orderfield].to_s.downcase end
			end
		end
	end

	def show
		@gist = gists = HTTParty.get(gists_host + "/gists/" + params[:id], :verify => false).parsed_response
	end
 
end
