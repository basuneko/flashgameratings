module GamesHelper
	def request(request)
		link_to request.portal.short_name, request, :class => "label", :style => "background-color:##{request.portal.color}"
	end
end
