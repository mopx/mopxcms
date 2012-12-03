module PagesHelper
	def parse_body(body)
		textilize(body).html_safe
	end
end
