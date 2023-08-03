module ApplicationHelper
	def graveter_for(user, option = {size:80})
		email_address = user&.email != nil ? user.email : "sandeepyadavscs@gmail.com"
		hash = Digest::MD5.hexdigest(email_address)
		url = "https://www.gravatar.com/avatar/#{hash}?s=#{option[:size]}"
		image_tag(url, alt: user&.user_name)
	end

	
end
