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
end
