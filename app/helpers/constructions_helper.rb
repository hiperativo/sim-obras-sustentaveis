module ConstructionsHelper
	def form_data(index)
		@data ||= YAML.load_file Rails.root.join "app", "models", "data_structure.yml"
		@data[index]
	end

	def data_structure
		Construction.data_structure
	end

	def only_keys(data)
		data.map{|o| if o.is_a?(Hash) then o.keys.first else o end}
	end

	def render_options(options={})
		options[:locals][:escolha] ||= "única"
		render options.merge partial: "sub_option"
	end

	def databased(name)
		name.parameterize.underscore
	end

	def requires(input, value=nil)
		output = {"requires" => input}
		output["desires"] = value unless value.nil?
		return output
	end

end
