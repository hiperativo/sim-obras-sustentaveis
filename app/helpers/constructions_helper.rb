module ConstructionsHelper
	def form_data(index)
		@data ||= YAML.load_file Rails.root.join "app", "models", "data_structure.yml"
		@data[index]
	end

	def only_keys(data)
		data.map{|o| if o.is_a?(Hash) then o.keys.first else o end}
	end

	# def only_with_sub_options(data)
	# 	data.map{|o| o if o.is_a?(Hash) }.compact
	# end

	def databased(name)
		name.parameterize.underscore.slice(0..62)
	end

	def requires(input, value=nil)
		output = {"data-requires" => input}
		output["data-desires"] = value unless value.nil?
		return output
	end

end
