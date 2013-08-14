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
			passo.values.first.each do |question|
				case question.class.to_s
				when "Hash"
					if question.values.first.is_a?(Hash)
						case question.values.first.keys.first 
						when "opções"
							colunas += extract_keys(question.keys.first, question.values.first["opções"])
						end
					else
						# segue a lógica de grupos mas com título
						colunas += question.values.first.map{|q|extract_keys(q)[0]}
					end

				when "Array"
					# segue a lógica de grupos mas sem título
					colunas += question.map{|q|extract_keys(q)[0]}
				end

			end
		end
		# n ||= 0
		# n += 1
		# raise [output_keys, n].to_yaml if n > 1
		# raise colunas.to_yaml
		colunas.compact.map{|c|c.parameterize.underscore.to_sym} + [:estado,
			:cidade,
			:tipologia,
			:tipologia_quais,
			:observacao,
			:sistema,
			:multipla_outros_quais,
			:sistema_outros_quais,
			:tipo_de_sistema_outros_quais,
			:perfil_nivel_de_certificacao_outros_quais,
			:vagas_verdes,
			:transporte_publico_metro,
			:transporte_publico_trem,
			:transporte_publico_ponto_de_onibus,
			:transporte_publico_outros,
			:alta_refletancia_solar,
			:como_voce_esta_reduzindo_o_efeito_de_ilhas_de_calor_no_empreendimento_outros_quais,
			:bacias_e_mictorios_outros_quais,
			:torneiras_outros_quais,
			:chuveiros_outros_quais,
			:irrigacao_outros_quais,
			:fontes_nao_potaveis_de_agua_agua_pluvial_agua_pluvial_outros_quais,
			:fontes_nao_potaveis_de_agua_agua_de_lencol_agua_de_lencol_outros_quais,
			:fontes_nao_potaveis_de_agua_agua_de_condensacao_agua_de_condensacao_outros_quais,
			:fontes_nao_potaveis_de_agua_agua_cinza_agua_cinza_outros_quais,
			:fontes_nao_potaveis_de_agua_agua_negra_agua_negra_outros_quais,
			:medicao_de_agua_medicao_setorizada_de_consumos_outros_quais,
			:drenagem_outros_quais,
			:ar_condicionado_condensacao_outros_quais,
			:ar_externo_outros_quais,
			:tipo_de_insuflamento_de_ar_outros_quais,
			:eletrica_fonte_de_energia_fonte_de_energia_outros_quais,
			:eletrica_outros_quais,
			:medicao_de_energia_medicao_setorizada_de_consumo_outros_quais,
			:energia_alternativa_outros_quais,
			:tipo_de_iluminacao_area_outros_quais,
			:protecoes_solares_tipos_brises_outros_quais,
			:equipamentos_variadores_de_frequencia_variadores_de_frequencia_outros_quais,
			:equipamentos_outros_quais,
			:material_de_baixo_voc_outros_quais,
			:pisos_e_carpetes_certificados_outros_quais,
			:existe_area_envidracada_na_fachada_sim_outros_quais,
			:qualidade_ambiental_ar_nivel_de_filtragem_outros_quais,
			:medicao_de_energia_medicao_setorizada_de_consumo_medicao_setorizada_de_consumo_outros_quais,
			:energia_alternativa_solar_fotovoltaica,
			:energia_alternativa_aquecimento_solar_de_agua,
			:energia_alternativa_biomassa,
			:energia_alternativa_eolica,
			:existe_area_envidracada_na_fachada_outros_quais,
			:protecoes_solares_tipos_brises_brises_outros_quais,
			:protecoes_solares_tipos_outros_quais,
			:madeira_certificada_fsc_outros_quais,
			:ar_condicionado_filtragem_outros_quais
		]
	end	

	def self.extract_keys(question, options=[], args={})
		output_keys=[]
		escolha = args[:escolha]
		parent_question = args[:parent_question]

		if escolha == "múltipla"
			options.each do |o|
				output_keys << [parent_question, question, (o.is_a?(Hash) ? o.keys.first : o)].compact.join(" ")
			end
		else
			output_keys << [parent_question, question].compact.join(" ")
		end

		options.each do |o|
			unless o.is_a?(Hash)
				unless question.is_a?(String)
					output_keys += extract_keys(o.keys.first, o.values.first, [parent_question, question.keys.first].compact.join(" ")) if o.is_a?(Hash)
				end
			end
			if o == "Outros"
				outro_campo = [parent_question, question].compact
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
