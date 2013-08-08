class Construction < ActiveRecord::Base

	def self.colunas
		data = YAML.load_file(Rails.root.join "app", "models", "data_structure.yml")
		
		colunas = []
		data.each do |passo|
			passo.values.first.each do |question|
				if question.values.first.include?("opções")
					colunas += extract_keys(question)
				end
			end
		end
		colunas.map!{|c|c.parameterize.underscore.to_sym}
		# raise colunas.to_yaml
	end	

	def self.extract_keys(question, parent_question=nil)
		output_keys = []
		parent_question ||= ""
		# raise question.to_yaml unless parent_question.blank?
		options = question.values.first["opções"]
		if question.values.first["escolha"] == "múltipla"
			options.each do |o|
				output_keys << parent_question + "_" + question.keys.first + "_" + case o.class.to_s
					when "String" then o 
					when "Hash" then o.keys.first
				end
				extract_keys(o, o.keys.first) if o.is_a?(Hash)
			end
		else
			output_keys << question.keys.first
		end
		options.each{|o| output_keys << parent_question + "_" + (question.keys.first)+"_"+ o + "_quais" if o == "Outros"}
		output_keys
	end

	attr_accessible :dados

	store :dados, accessors: self.colunas
	attr_accessor :passo, :proximo_passo

	validates :nome_da_obra, presence: true
	validates :codigo_obra, presence: true

	def self.to_csv(options={})
		CSV.generate(options) do |csv|
			@colunas = colunas.map{|c| c.to_s}
			csv << @colunas
			all.each do |item|
				csv << item.dados.values_at(*@colunas).map do |v|
					v = case v
						when "1" then "Sim"
						when "0" then "Não"
						else v
					end
				end
			end
		end
	end

end
