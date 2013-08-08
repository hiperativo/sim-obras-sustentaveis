class Construction < ActiveRecord::Base

	def self.data_structure
		# @data ||= 
		YAML.load_file(Rails.root.join "app", "models", "data_structure.yml")
	end

	def self.passos
		@passos ||= data_structure.map{|passo| passo.keys.first}
	end

	def self.colunas
		colunas = []
		data_structure.each do |passo|
			passo.values.first.each do |q|
				questions = (q["grupo"] if q.keys.first == "grupo") if q.is_a?(Hash)
				questions ||= [q]
				for question in questions
					if question.is_a?(Hash)
						colunas += extract_keys(question)
					else
						colunas << question
					end
				end
			end
		end
		colunas.compact.map{|c|c.parameterize.underscore.to_sym}
	end	

	def self.extract_keys(question, parent_question=nil)
		options = question.values.first["opções"]
		output_keys = []
		if question.values.first["escolha"] == "múltipla"
			options.each do |o|
				output_keys << [parent_question, question.keys.first, (o.is_a?(Hash) ? o.keys.first : o)].compact.join(" ")
			end
		else
			output_keys << [parent_question, question.keys.first].compact.join(" ")
		end
		options.each do |o|
			output_keys += extract_keys(o, [parent_question, question.keys.first].compact.join(" ")) if o.is_a?(Hash)
			if o == "Outros"
				outro_campo = [parent_question, question.keys.first].compact
				outro_campo << o # if question.values.first["escolha"] == "múltipla"
				outro_campo << "Quais"
				output_keys << outro_campo.compact.join(" ")
			end
		end
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
