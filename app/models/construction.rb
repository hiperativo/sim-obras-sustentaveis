class Construction < ActiveRecord::Base
	attr_accessor :passo, :proximo_passo, :sistema, 
	:sistema_outros_enable,
	:tipo_de_sistema_outros_enable,
	:proximidade_ao_tpublico_outros_enable,
	:bacias_e_mictorios_outros_enable,
	:bacias_e_mictorios_outros,
	:agua_pluvial_outros_enable,
	:agua_de_lencol_outros_enable,
	:agua_condensacao_tratada_outros_enable,
	:agua_cinza_tratada_outros_enable,
	:agua_negra_tratada_outros_enable,
	:ar_condicionado_outros_enable,
	:eletrica_fonte_de_energia_outros_enable,
	:eletrica_outros_enable,
	:eletrica_tipo_enable,
	:energia_alternativa_outros_enable,
	:iluminacao_outros_enable,
	:equipamentos_outros_enable,
	:como_esta_reduzindo_ilhas_de_calor_outros_enable,
	:drenagem_outros_enable,
	:tratamento_de_ar_externo_outros_enable,
	:variador_frequencia_outros_enable,
	:tipo_de_insuflamento_de_ar_outros_enable,
	:vidros_area_envidracada_outros_enable,
	:coleta_de_residuos_reciclaveis_outros_enable,
	:coleta_de_residuos_reciclaveis_nivel_filtragem_enable,
	:perfil_nivel_de_certificacao_categoria_n_1_relacao_do_edificio_co,
	:perfil_nivel_de_certificacao_categoria_n_2_escolha_integrada_de_p,
	:perfil_nivel_de_certificacao_categoria_n_3_canteiro_de_obras_com_,
	:perfil_nivel_de_certificacao_categoria_n_4_gestao_da_energia,
	:perfil_nivel_de_certificacao_categoria_n_5_gestao_da_agua,
	:perfil_nivel_de_certificacao_categoria_n_6_gestao_dos_residuos_de,
	:perfil_nivel_de_certificacao_categoria_n_7_manutencao_permanencia,
	:perfil_nivel_de_certificacao_categoria_n_8_conforto_higrotermico,
	:perfil_nivel_de_certificacao_categoria_n_9_conforto_acustico,
	:perfil_nivel_de_certificacao_categoria_n_10_conforto_visual,
	:perfil_nivel_de_certificacao_categoria_n_11_conforto_olfativo,
	:perfil_nivel_de_certificacao_categoria_n_12_qualidade_sanitaria_d,
	:perfil_nivel_de_certificacao_categoria_n_13_qualidade_sanitaria_d,
	:perfil_nivel_de_certificacao_categoria_n_14_qualidade_sanitaria_d,
	:perfil_nivel_de_certificacao_enable_categoria_n_1_relacao_do_edif,
	:perfil_nivel_de_certificacao_enable_categoria_n_2_escolha_integra,
	:perfil_nivel_de_certificacao_enable_categoria_n_3_canteiro_de_obr,
	:perfil_nivel_de_certificacao_enable_categoria_n_4_gestao_da_energ,
	:perfil_nivel_de_certificacao_enable_categoria_n_5_gestao_da_agua,
	:perfil_nivel_de_certificacao_enable_categoria_n_6_gestao_dos_resi,
	:perfil_nivel_de_certificacao_enable_categoria_n_7_manutencao_perm,
	:perfil_nivel_de_certificacao_enable_categoria_n_8_conforto_higrot,
	:perfil_nivel_de_certificacao_enable_categoria_n_9_conforto_acusti,
	:perfil_nivel_de_certificacao_enable_categoria_n_10_conforto_visua,
	:perfil_nivel_de_certificacao_enable_categoria_n_11_conforto_olfat,
	:perfil_nivel_de_certificacao_enable_categoria_n_12_qualidade_sani,
	:perfil_nivel_de_certificacao_enable_categoria_n_13_qualidade_sani,
	:perfil_nivel_de_certificacao_enable_categoria_n_14_qualidade_sani


	validates :nome_da_obra, presence: true
	validates :codigo_obra, presence: true

	def self.to_csv(options={})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names).map do |v|
					v = case v.class.to_s
						when "TrueClass" 					then "Sim"
						when "FalseClass" 					then "Não"
						when "ActiveSupport::TimeWithZone" 	then I18n.l(v, format: :long)
						else v.to_s
					end
				end
			end
		end
	end

end
