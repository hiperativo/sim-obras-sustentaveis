class Log < ActiveRecord::Base
	belongs_to :admin
	attr_accessible :action, :admin_id, :details
	
	def day
		I18n.l(self.created_at, format: "%d de %B de %Y")
	end

	def self.to_csv(options={})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end

end