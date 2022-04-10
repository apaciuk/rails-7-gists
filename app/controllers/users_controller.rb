class UsersController < ApplicationController
	include GistsHelper
	def show
		@user = params["name"]
		gists = HTTParty.get("#{gists_host}#{get_user_gists_route(@user)}?per_page=100", :verify => false).parsed_response
		@gists = format_gists(gists)
	end


	private
	def get_user_gists_route(name)
		return "/users/#{name}/gists"
	end
end
