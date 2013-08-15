class Construction < ActiveRecord::Base

	def self.data_structure
		# @data ||= 
		YAML.load_file(Rails.root.join "app", "models", "data_structure.yml")
	end

	def self.passos
		@passos ||= data_structure.map{|passo| passo.keys.first}
	end

	def self.colunas
		colunas = ["codigo_obra", "nome_da_obra", "tipo_de_logradouro", "bairro", "cep", "estado", "cidade", "nome_1", "telefone_1", "e_mail_1", "razao_social_1", "nome_2", "telefone_2", "e_mail_2", "razao_social_2", "nome_3", "telefone_3", "e_mail_3", "razao_social_3", "nome_4", "telefone_4", "e_mail_4", "razao_social_4", "m_unidade", "m_util_total", "n_de_unidades", "n_de_andares", "estrutura_utilizada", "laje_utilizada", "inicio_da_obra", "termino_da_obra", "projeto", "lancamento", "fundacao", "estrutura", "acabamento", "paralisada", "conclusao", "proprietario1", "proprierario2", "proprietario3", "proprietario4", "investidor1", "investidor2", "investidor3", "investidor4", "codigo_1", "codigo_2", "codigo_3", "codigo_4", "tipologia", "tipologia_quais", "teve_consultoria_de_sustentabilidade_e_certificacao_ambiental_leed_aqua_etc", "observacao", "sistema_leed", "sistema_aqua", "sistema_procel_edifica", "sistema_qualiverde", "sistema_bream", "sistema_dgnb", "sistema_lbc", "sistema_outros", "sistema_outros_quais", "tipo_de_sistema_leed_nc", "tipo_de_sistema_leed_cs", "tipo_de_sistema_leed_ci", "tipo_de_sistema_leed_eb_oem", "tipo_de_sistema_aqua_bairros_e_loteamentos", "tipo_de_sistema_aqua_edificios_habitacionais", "tipo_de_sistema_aqua_servicos", "tipo_de_sistema_aqua_operacao_e_uso", "tipo_de_sistema_procel_residencial", "tipo_de_sistema_procel_comercial", "tipo_de_sistema_outros", "tipo_de_sistema_outros_quais", "perfil_nivel_de_certificacao", "perfil_nivel_de_certificacao_outros_quais", "aqua_categoria_0", "aqua_categoria_1", "aqua_categoria_2", "aqua_categoria_3", "aqua_categoria_4", "aqua_categoria_5", "aqua_categoria_6", "aqua_categoria_7", "aqua_categoria_8", "aqua_categoria_9", "aqua_categoria_10", "aqua_categoria_11", "aqua_categoria_12", "aqua_categoria_13", "vagas_verdes", "estacoes_de_recarga_de_veiculos_eletricos", "bicicletarios", "vestiarios_com_chuveiro", "transporte_publico_metro", "transporte_publico_trem", "transporte_publico_ponto_de_onibus", "transporte_publico_outros", "como_voce_esta_reduzindo_o_efeito_de_ilhas_de_calor_no_empreendimento_alta_refletancia_solar", "como_voce_esta_reduzindo_o_efeito_de_ilhas_de_calor_no_empreendimento_telhado_verde", "como_voce_esta_reduzindo_o_efeito_de_ilhas_de_calor_no_empreendimento_vagas_cobertas", "como_voce_esta_reduzindo_o_efeito_de_ilhas_de_calor_no_empreendimento_piso_concregama", "como_voce_esta_reduzindo_o_efeito_de_ilhas_de_calor_no_empreendimento_outros", "como_voce_esta_reduzindo_o_efeito_de_ilhas_de_calor_no_empreendimento_outros_quais", "bacias_e_mictorios_bacias_a_vacuo", "bacias_e_mictorios_bacias_dual_flux", "bacias_e_mictorios_het_vasos_com_consumo_menor_de_4_litros", "bacias_e_mictorios_mictorios_secos", "bacias_e_mictorios_mictorio_com_fechamento_hidromecanico", "bacias_e_mictorios_mictorio_com_fechamento_com_sensor_de_presenca", "bacias_e_mictorios_outros", "bacias_e_mictorios_outros_quais", "torneiras_restritores_de_vazao", "torneiras_acionamento_hidromecanico", "torneiras_sensor_de_presenca", "torneiras_regulador_de_vazao", "torneiras_outros", "torneiras_outros_quais", "chuveiros", "chuveiros_outros_quais", "irrigacao", "irrigacao_outros_quais", "piscina", "piscina_outros_quais", "torres_de_resfriamento", "torres_de_resfriamento_sim_aberta", "torres_de_resfriamento_sim_fechada", "torres_de_resfriamento_sim_dry_cooler", "torres_de_resfriamento_sim_controle_automatico_de_purga", "fontes_nao_potaveis_de_agua_agua_pluvial", "fontes_nao_potaveis_de_agua_agua_pluvial_agua_pluvial_para_irrigacao_do_paisagismo", "fontes_nao_potaveis_de_agua_agua_pluvial_agua_pluvial_para_lavagem_de_pisos", "fontes_nao_potaveis_de_agua_agua_pluvial_agua_pluvial_para_bacias_e_mictorios", "fontes_nao_potaveis_de_agua_agua_pluvial_agua_pluvial_outros", "fontes_nao_potaveis_de_agua_agua_pluvial_agua_pluvial_outros_quais", "fontes_nao_potaveis_de_agua_agua_de_lencol", "fontes_nao_potaveis_de_agua_agua_de_lencol_agua_de_lencol_para_irrigacao_do_paisagismo", "fontes_nao_potaveis_de_agua_agua_de_lencol_agua_de_lencol_para_lavagem_de_pisos", "fontes_nao_potaveis_de_agua_agua_de_lencol_agua_de_lencol_para_bacias_e_mictorios", "fontes_nao_potaveis_de_agua_agua_de_lencol_agua_de_lencol_outros", "fontes_nao_potaveis_de_agua_agua_de_lencol_agua_de_lencol_outros_quais", "fontes_nao_potaveis_de_agua_agua_de_condensacao", "fontes_nao_potaveis_de_agua_agua_de_condensacao_agua_de_condensacao_para_irrigacao_do_paisagismo", "fontes_nao_potaveis_de_agua_agua_de_condensacao_agua_de_condensacao_para_lavagem_de_pisos", "fontes_nao_potaveis_de_agua_agua_de_condensacao_agua_de_condensacao_para_bacias_e_mictorios", "fontes_nao_potaveis_de_agua_agua_de_condensacao_agua_de_condensacao_outros", "fontes_nao_potaveis_de_agua_agua_de_condensacao_agua_de_condensacao_outros_quais", "fontes_nao_potaveis_de_agua_agua_cinza", "fontes_nao_potaveis_de_agua_agua_cinza_agua_cinza_para_irrigacao_do_paisagismo", "fontes_nao_potaveis_de_agua_agua_cinza_agua_cinza_para_lavagem_de_pisos", "fontes_nao_potaveis_de_agua_agua_cinza_agua_cinza_para_bacias_e_mictorios", "fontes_nao_potaveis_de_agua_agua_cinza_agua_cinza_outros", "fontes_nao_potaveis_de_agua_agua_cinza_agua_cinza_outros_quais", "fontes_nao_potaveis_de_agua_agua_negra", "fontes_nao_potaveis_de_agua_agua_negra_agua_negra_para_irrigacao_do_paisagismo", "fontes_nao_potaveis_de_agua_agua_negra_agua_negra_para_lavagem_de_pisos", "fontes_nao_potaveis_de_agua_agua_negra_agua_negra_para_bacias_e_mictorios", "fontes_nao_potaveis_de_agua_agua_negra_agua_negra_outros", "fontes_nao_potaveis_de_agua_agua_negra_agua_negra_outros_quais", "medicao_de_agua", "medicao_de_agua_medicao_setorizada_de_consumos", "medicao_de_agua_medicao_setorizada_de_consumos_outros_quais", "drenagem_pisos_permeaveis", "drenagem_caixa_de_retardo", "drenagem_remocao_de_solidos_suspensos_filtros_vortex", "drenagem_captacao_e_aproveitamente_de_agua_pluvial", "drenagem_outros", "drenagem_outros_quais", "ar_condicionado_condensacao_vrf", "ar_condicionado_condensacao_vrf_vrf", "ar_condicionado_condensacao_central_de_agua_gelada", "ar_condicionado_condensacao_central_de_agua_gelada_central_de_agua_gelada", "ar_condicionado_condensacao_central_de_agua_gelada_central_de_agua_gelada_chiller_eletrico", "ar_condicionado_condensacao_central_de_agua_gelada_central_de_agua_gelada_condensacao_por_ar_ou_agua", "ar_condicionado_condensacao_outros", "ar_condicionado_condensacao_outros_quais", "ar_externo_roda_entalpica", "ar_externo_trocador_de_calor", "ar_externo_controle_de_demanda_de_ventilacao_por_co2", "ar_externo_outros", "ar_externo_outros_quais", "tipo_de_insuflamento_de_ar_teto", "tipo_de_insuflamento_de_ar_piso", "tipo_de_insuflamento_de_ar_vigas_frias", "tipo_de_insuflamento_de_ar_outros", "tipo_de_insuflamento_de_ar_outros_quais", "eletrica_entrada_de_energia", "eletrica_entrada_de_energia_entrada_de_energia_alta", "eletrica_entrada_de_energia_entrada_de_energia_media", "eletrica_entrada_de_energia_entrada_de_energia_baixa", "eletrica_fonte_de_energia", "eletrica_fonte_de_energia_fonte_de_energia_eletrica", "eletrica_fonte_de_energia_fonte_de_energia_gas", "eletrica_fonte_de_energia_fonte_de_energia_outros", "eletrica_fonte_de_energia_fonte_de_energia_outros_quais", "eletrica_geracao", "eletrica_geracao_geracao_peak_shaving", "eletrica_geracao_geracao_possui_100_de_backup", "eletrica_cogeracao", "eletrica_outros", "eletrica_outros_quais", "medicao_de_energia_medicao_setorizada_de_consumo", "medicao_de_energia_medicao_setorizada_de_consumo_medicao_setorizada_de_consumo_elevadores", "medicao_de_energia_medicao_setorizada_de_consumo_medicao_setorizada_de_consumo_ar_condicionado", "medicao_de_energia_medicao_setorizada_de_consumo_medicao_setorizada_de_consumo_ventilacao", "medicao_de_energia_medicao_setorizada_de_consumo_medicao_setorizada_de_consumo_iluminacao", "medicao_de_energia_medicao_setorizada_de_consumo_medicao_setorizada_de_consumo_outros", "medicao_de_energia_medicao_setorizada_de_consumo_medicao_setorizada_de_consumo_outros_quais", "medicao_de_energia_sistema_de_gerenciamento_de_consumo", "energia_alternativa_solar_fotovoltaica", "energia_alternativa_aquecimento_solar_de_agua", "energia_alternativa_eolica", "energia_alternativa_biomassa", "energia_alternativa_outros", "energia_alternativa_outros_quais", "tipo_de_iluminacao_area_lampadas_t5", "tipo_de_iluminacao_area_lampadas_t5_lampadas_t5_area_privativa", "tipo_de_iluminacao_area_lampadas_t5_lampadas_t5_area_comum", "tipo_de_iluminacao_area_lampadas_led", "tipo_de_iluminacao_area_integracao_da_iluminacao_com_a_iluminacao_natural", "tipo_de_iluminacao_area_dali", "tipo_de_iluminacao_area_sensores_de_presenca_em_areas_comuns", "tipo_de_iluminacao_area_controles_de_acionamento_automatizado", "tipo_de_iluminacao_area_fotocelulas_na_iluminacao_externa", "tipo_de_iluminacao_area_outros", "tipo_de_iluminacao_area_outros_quais", "ar_condicionado_filtragem_nivel_de_filtragem", "ar_condicionado_filtragem_nivel_de_filtragem_nivel_de_filtragem", "ar_condicionado_filtragem_sistemas_de_tratamento_de_ar_interno", "ar_condicionado_filtragem_outros", "ar_condicionado_filtragem_outros_quais", "existe_area_envidracada_na_fachada_insulado", "existe_area_envidracada_na_fachada_laminado", "existe_area_envidracada_na_fachada_low_e_baixa_emissividade", "existe_area_envidracada_na_fachada_outros", "existe_area_envidracada_na_fachada_outros_quais", "protecoes_solares_tipos_brises", "protecoes_solares_tipos_brises_brises", "protecoes_solares_tipos_brises_brises_outros_quais", "protecoes_solares_tipos_persianas_automatizadas_internas", "protecoes_solares_tipos_outros", "protecoes_solares_tipos_outros_quais", "equipamentos_motores_de_alta_eficiencia", "equipamentos_elevadores_eficientes", "equipamentos_elevadores_eficientes_elevadores_eficientes_antecipador_de_chamada", "equipamentos_elevadores_eficientes_elevadores_eficientes_frangem_degenerativa", "equipamentos_variadores_de_frequencia", "equipamentos_variadores_de_frequencia_variadores_de_frequencia_nos_ventiladores_de_tomadas_de_ar_externos", "equipamentos_variadores_de_frequencia_variadores_de_frequencia_nas_bombas_de_agua_gelada", "equipamentos_variadores_de_frequencia_variadores_de_frequencia_nas_torres_de_resfriamento", "equipamentos_variadores_de_frequencia_variadores_de_frequencia_nos_fan_coils", "equipamentos_variadores_de_frequencia_variadores_de_frequencia_nos_chillers", "equipamentos_variadores_de_frequencia_variadores_de_frequencia_outros", "equipamentos_variadores_de_frequencia_variadores_de_frequencia_outros_quais", "equipamentos_outros", "equipamentos_outros_quais", "material_de_baixo_voc_tintas", "material_de_baixo_voc_adesivos", "material_de_baixo_voc_outros", "material_de_baixo_voc_outros_quais", "material_de_baixo_voc_compostos_de_madeira", "madeira_certificada_fsc_acabamentos", "madeira_certificada_fsc_mobiliarios", "madeira_certificada_fsc_portas", "madeira_certificada_fsc_outros", "madeira_certificada_fsc_outros_quais", "pisos_e_carpetes_certificados", "pisos_e_carpetes_certificados_outros_quais", "infraestrutura_para_coleta_de_residuos_reciclaveis", "infraestrutura_para_coleta_de_residuos_reciclaveis_outros_quais"]
		# data_structure.each do |passo|
		# 	passo.values.first.each do |question|
		# 		case question.class.to_s
		# 		when "Hash"
		# 			if question.values.first.is_a?(Hash)
		# 				case question.values.first.keys.first 
		# 				when "opções"
		# 					colunas += extract_keys(question.keys.first, question.values.first["opções"])
		# 				end
		# 			else
		# 				# segue a lógica de grupos mas com título
		# 				colunas += question.values.first.map{|q|extract_keys(q)[0]}
		# 			end

		# 		when "Array"
		# 			# segue a lógica de grupos mas sem título
		# 			colunas += question.map{|q|extract_keys(q)[0]}
		# 		end

		# 	end
		# end
		colunas.compact.map{|c|c.parameterize.underscore.to_sym}
	end	

	# def self.extract_keys(question, options=[], args={})
	# 	output_keys=[]
	# 	escolha = args[:escolha]
	# 	parent_question = args[:parent_question]

	# 	if escolha == "múltipla"
	# 		options.each do |o|
	# 			output_keys << [parent_question, question, (o.is_a?(Hash) ? o.keys.first : o)].compact.join(" ")
	# 		end
	# 	else
	# 		output_keys << [parent_question, question].compact.join(" ")
	# 	end

	# 	options.each do |o|
	# 		unless o.is_a?(Hash)
	# 			unless question.is_a?(String)
	# 				output_keys += extract_keys(o.keys.first, o.values.first, [parent_question, question.keys.first].compact.join(" ")) if o.is_a?(Hash)
	# 			end
	# 		end
	# 		if o == "Outros"
	# 			outro_campo = [parent_question, question].compact
	# 			outro_campo << o # if question.values.first["escolha"] == "múltipla"
	# 			outro_campo << "Quais"
	# 			output_keys << outro_campo.compact.join(" ")
	# 		end
	# 	end
	# 	output_keys
	# end

	store :dados, accessors: self.colunas
	
	attr_accessible :dados

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
