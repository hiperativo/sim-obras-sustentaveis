class AddConstructionFields < ActiveRecord::Migration
  def up
  	change_table :constructions do |t|
  		t.string :codigo_obra
  		t.string :nome_da_obra
  		t.string :tipo_de_logradouro
  		t.string :logradouro
  		t.string :bairro
  		t.string :cep
  		t.string :estado
  		t.string :cidade
  		t.string :m2_unidade
  		t.string :m2_util_total
  		t.string :numero_de_andares
  		t.string :inicio_da_obra
  		t.string :termino_da_obra
  		t.string :projeto
  		t.string :lancamento
  		t.string :fundacao
  		t.string :estrutura
  		t.string :acabamento
  		t.string :paralisada
  		t.string :concluida
  		t.string :proprietario1
  		t.string :proprierario2
  		t.string :proprietario3
  		t.string :proprietario4
  		t.string :investidor1
  		t.string :investidor2
  		t.string :investidor3
  		t.string :investidor4
  		t.string :construtora1_codigo
  		t.string :construtora2_codigo
  		t.string :construtora3_codigo
  		t.string :construtora4_codigo
  		t.string :tipo_de_obra
  		t.string :tipo_de_obra_outros
  		t.string :ficha_tecnica_observacao
  		t.boolean :sistema_leed
  		t.boolean :sistema_aqua
  		t.boolean :sistema_procel_edifica
  		t.boolean :sistema_qualiverde
  		t.boolean :sistema_bream
  		t.boolean :sistema_dgnb
  		t.boolean :sistema_lbc
  		t.string :sistema_outros
  		t.boolean :leed_nc
  		t.boolean :leed_cs
  		t.boolean :leed_ci
  		t.boolean :leed_eb
  		t.boolean :aqua_bairros
  		t.boolean :aqua_edificios
  		t.boolean :aqua_servicos
  		t.boolean :aqua_operacao_e_uso
  		t.boolean :procel_residencial
  		t.boolean :procel_comercial
  		t.string :tipo_de_sistema_outros
  		t.string :versao_do_sistema
  		t.string :leed_platinum
  		t.string :leed_gold
  		t.string :leed_silver
  		t.string :leed_certified
  		t.string :perfil_nivel_de_certificacao

  		t.boolean :vagas_verdes
  		t.integer :vagas_verdes_quantidade
 
  		t.boolean :estacoes_de_recarga_de_veiculos_eletricos
  		t.integer :estacoes_de_recarga_de_veiculos_eletricos_quantidade

  		t.boolean :bicicletarios
  		t.integer :bicicletarios_quantidade

  		t.boolean :vestiarios_com_chuveiro
  		t.integer :vestiarios_com_chuveiro_quantidade

  		t.boolean :proximidade_ao_tpublico_metro
  		t.integer :proximidade_ao_tpublico_metro_distancia_aproximada

  		t.boolean :proximidade_ao_tpublico_trem
  		t.string :proximidade_ao_tpublico_trem_distancia_aproximada

  		t.boolean :proximidade_ao_tpublico_ponto_de_onibus
  		t.string :proximidade_ao_tpublico_ponto_de_onibus_distancia_aproximada

  		t.string :proximidade_ao_tpublico_outros
  		t.string :proximidade_ao_tpublico_outros_distancia_aproximada
  		
  		t.boolean :reducao_do_efeito_de_ilhas_de_calor_alta_refletância_solar
  		t.boolean :reducao_do_efeito_de_ilhas_de_calor_telhado_verde
  		t.string :reducao_do_efeito_de_ilhas_de_calor__outros

  		t.boolean :bacias_e_mictorios_bacias_a_vacuo
  		t.boolean :bacias_e_mictorios_bacias_dual_flux
  		t.boolean :bacias_e_mictorios_het
  		t.boolean :bacias_e_mictorios_mictorios_secos
  		t.boolean :bacias_e_mictorios_mictorio_eficiente
  		t.boolean :bacias_e_mictorios_mictorio_fechamento_hidromecanico
  		t.boolean :bacias_e_mictorios_mictorio_fechamento_com_sensor_de_presenca
  		t.string :outros

  		t.string :torneiras
  		t.string :chuveiros
  		t.string :irrigacao
  		t.string :piscina

  		t.boolean :torres_de_resfriamento
  		t.string :torres_de_resfriamento_tipo

  		t.boolean :agua_pluvial
  		t.boolean :agua_pluvial_para_irrigacao_do_paisagismo
  		t.boolean :agua_pluvial_para_lavagem_de_pisos
  		t.boolean :agua_pluvial_para_bacias
  		t.boolean :agua_pluvial_para_ar_condicionado
  		t.boolean :agua_pluvial_piscina
  		t.string :agua_pluvial_outros

  		t.boolean :agua_de_lencol
  		t.boolean :agua_de_lencol_para_irrigacao_do_paisagismo
  		t.boolean :agua_de_lencol_para_lavagem_de_pisos
  		t.boolean :agua_de_lencol_para_bacias
  		t.boolean :agua_de_lencol_para_ar_condicionado
  		t.boolean :agua_de_lencol_piscina
  		t.string :agua_de_lencol_outros

  		t.boolean :agua_condensacao_tratada
  		t.boolean :agua_condensacao_tratada_para_irrigacao_do_paisagismo
  		t.boolean :agua_condensacao_tratada_para_lavagem_de_pisos
  		t.boolean :agua_condensacao_tratada_para_bacias
  		t.boolean :agua_condensacao_tratada_para_ar_condicionado
  		t.boolean :agua_condensacao_tratada_piscina
  		t.string :agua_condensacao_tratada_outros

  		t.boolean :agua_cinza_tratada
  		t.boolean :agua_cinza_tratada_para_irrigacao_do_paisagismo
  		t.boolean :agua_cinza_tratada_para_lavagem_de_pisos
  		t.boolean :agua_cinza_tratada_para_bacias
  		t.boolean :agua_cinza_tratada_para_ar_condicionado
  		t.boolean :agua_cinza_tratada_piscina
  		t.string :agua_cinza_tratada_outros

  		t.boolean :agua_negra_tratada
  		t.boolean :agua_negra_tratada_para_irrigacao_do_paisagismo
  		t.boolean :agua_negra_tratada_para_lavagem_de_pisos
  		t.boolean :agua_negra_tratada_para_bacias
  		t.boolean :agua_negra_tratada_para_ar_condicionado
  		t.boolean :agua_negra_tratada_piscina
  		t.string :agua_negra_tratada_outros

  		t.boolean :drenagem_pisos_permeaveis
  		t.boolean :drenagem_caixa_de_retardo
  		t.boolean :drenagem_remocao_de_solidos_suspensos
  		t.string :drenagem_outros

  		t.boolean :vrf
  		t.string :vrf_tipo

  		t.boolean :central_de_agua_gelada
  		t.string :central_de_agua_gelada_tipo

  		t.string :ar_condicionado_outros

  		t.string :tratamento_de_ar_externo_roda_entalpica
  		t.string :tratamento_de_ar_externo_trocador_de_calor
  		t.string :tratamento_de_ar_externo_outros

  		t.boolean :variador_frequencia_nos_ventiladores_de_tomadas_de_ar_externos
  		t.boolean :variador_frequencia_nos_fan_coils
  		t.boolean :variador_frequencia_nos_chillers
  		t.string :variador_frequencia_outros

  		t.boolean :tipo_de_insuflamento_de_ar
  		t.boolean :tipo_de_insuflamento_de_ar_teto
  		t.boolean :tipo_de_insuflamento_de_ar_piso
  		t.boolean :tipo_de_insuflamento_de_ar_vigas_frias
  		t.string :tipo_de_insuflamento_de_ar_teto_outros

  		t.string :tipos_de_protecoes_solares

  		t.boolean :vidros_area_envidracada
  		t.boolean :vidros_area_envidracada_laminado
  		t.boolean :vidros_area_envidracada_low_e
  		t.boolean :vidros_area_envidraçada_da_fachada
  		t.string :vidros_area_envidraçada_da_fachada_porcentagem

  		t.boolean :eletrica_motor_de_alta_eficiencia
  		t.boolean :eletrica_medicao_setorizada_de_consumo_de_energia
  		t.boolean :eletrica_entrada_de_energia
  		t.string :eletrica_tipo
  		t.boolean :eletrica_fonte_de_energia
  		t.boolean :eletrica_fonte_de_energia_eletrica
  		t.boolean :eletrica_fonte_de_energia_gas
  		t.string :eletrica_fonte_de_energia_outros

  		t.boolean :energia_alternativa_solar_fotovaltaica
  		t.boolean :energia_alternativa_aquecimento_solar_de_agua
  		t.boolean :energia_alternativa_eolica
  		t.boolean :energia_alternativa_biomassa
  		t.string :energia_alternativa_outros

  		t.boolean :iluminacao_lampadas_t5
  		t.boolean :iluminacao_lampadas_t5_area_privativa
  		t.boolean :iluminacao_lampadas_t5_area_comum
  		t.boolean :iluminacao_lampadas_led
  		t.boolean :iluminacao_integracao_da_iluminacao_com_a_iluminacao_natural
  		t.boolean :iluminacao_dali
  		t.boolean :iluminacao_sensores_de_presenca_em_areas_comuns
  		t.boolean :iluminacao_controles_acionamento_automatizado
  		t.boolean :iluminacao_fotocelulas_na_iluminacao_externa
  		t.string :iluminacao_outros

  		t.boolean :equipamentos_elevadores_eficientes
  		t.boolean :equipamentos_frenagem_regenerativa
  		t.boolean :equipamentos_adc
  		t.string :equipamentos_outros

  		t.string :material_de_baixo_voc
  		t.string :material_de_baixo_voc_outros

  		t.string :madeira_certificada

  		t.string :pisos_e_carpetes_certificados

  		t.boolean :coleta_de_residuos_reciclaveis_deposito_central
  		t.boolean :coleta_de_residuos_reciclaveis_deposito_no_pavimento
  		t.string :coleta_de_residuos_reciclaveis_outros

  		t.boolean :nivel_de_filtragem
  		t.string :nivel_de_filtragem_nivel

  		t.boolean :sistemas_de_tratamento_de_ar_interno
  		t.string :sistemas_de_tratamento_de_ar_interno_outros

  	end
  end

  def down
  end
end
