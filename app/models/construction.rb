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
	:coleta_de_residuos_reciclaveis_nivel_filtragem_enable

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
