module GistsHelper
	def gists_host
		"https://api.github.com"
	end

	def no_user_placeholder
		"anonymous"
	end

	def format_gists(gists)
		formated_gists = Array.new
		gists.each do |gist|
			formated_gists.push format_gist(gist)
		end
		return formated_gists
	end

	def format_gist(gist)
		formated_gist = Hash.new

		formated_gist["id"] = gist["id"]
		formated_gist["owner"] = gist["owner"].nil? ? no_user_placeholder : gist["owner"]["login"]
		formated_gist["description"] = gist["description"].to_s == '' ? "no description" : gist["description"]
		formated_gist["created_at"] = _format_date(gist["created_at"])
		formated_gist["updated_at"] = _format_date(gist["updated_at"])
		formated_gist["number_of_files"] = gist["files"].nil? ? "0" : gist["files"].length
		formated_gist["number_of_comments"] = gist["comments"].nil? ? "0" : gist["comments"]

		return formated_gist
	end

	def order_link(field)
		order_desc_check = @orderfield == field && @order == "asc"
		orderèpart = order_desc_check ?  "&order=desc" : ""
		return all_gists_path + "?orderfield=" + field + orderèpart
	end

	private
	def _format_date(datetime_string)
		DateTime.parse(datetime_string).strftime("%e %b %Y %T")
	end
end
