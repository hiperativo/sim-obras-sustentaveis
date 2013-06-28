module ApplicationHelper
	def breadcrumbs
		items = request.env['PATH_INFO'].split("/").map do |item|
			{name: item.gsub("-", " ").humanize, value: item} unless item.blank?
		end
		items.compact
	end

	def sluggify(word)
		word.parameterize.gsub "-", "_"
	end

end
