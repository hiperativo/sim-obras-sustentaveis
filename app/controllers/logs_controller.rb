class LogsController < ApplicationController
	before_filter :autenticar_super_admin?
	def index
		@logs = Log.order(:created_at)
		respond_to do |f|
			f.html{ render }
			f.xls{ send_data Log.to_csv(col_sep: "\t") }
		end
	end
end
