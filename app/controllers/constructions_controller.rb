class ConstructionsController < ApplicationController
	before_filter :authenticate_admin!, :set_variables

	def new
		params[:passo] = @passos.first.parameterize.underscore if params[:passo].nil?
		@obra = Construction.new
	end
	
	def create
		@obra = Construction.new(params[:construction]).save
		@passo = params[:construction][:passo].parameterize.underscore
		@pagina = @passos.collect(&:parameterize).collect(&:underscore).index(@passo)
		if @pagina+1 < @passos.size
			redirect_to action: "new", passo: @passos[@pagina+1].parameterize.underscore
		else
			redirect_to action: "index"
		end
	end

	def index
		@obras = Construction.all
	end

	protected

	def set_variables
		@passos = ["ficha técnica", "certificação", "terreno", "água", "energia", "fachada", "iluminação", "materiais e resíduos"]
		@groups_checkboxes_certificacao = [
			{
				options: [], 
				group_name: "15. Sistema",
				prefix: "sistema", 
				collection: ["LEED", "Aqua", "Procel Edifica", "Qualiverde", "Bream", "DGNB", "LBC", "Outros"]
			},
			{
				options: [], 
				group_name: "16. Tipo de sistema",
				prefix: nil, 
				collection: ["LEED NC", "LEED CS", "LEED CI", "LEED EB", [:aqua_bairros, "Aqua Bairros e loteamentos"], [:aqua_edificios, "Aqua Edifícios Habitacionais"], "Aqua Serviços", "Aqua Operação e Uso", "Procel Residencial", "Procel Comercial", [:tipo_de_sistema_outros, "Outros"]]
			}
		]

		@boolean_radios_terreno = [
			[:vagas_verdes, "19. Vagas verdes"],
			[:estacoes_de_recarga_de_veiculos_eletricos, "20. Estações de recarga de veículos elétricos"],
			[:bicicletarios, "21. Bicicletários"],
			[:vestiarios_com_chuveiro, "22. Vestiários com chuveiro"]
		]

		@transportes_publicos = {
				options: [:intercalar_distancia_aproximada], 
				group_name: "23. Transporte público",
				prefix: "proximidade_ao_tpublico", 
				collection: ["Metro", "Trem", "Ponto de ônibus", "Outros"]
			}

		@bacias_mictorios = {
			options: [], 
			group_name: "24. Bacias e Mictorios",
			prefix: "bacias_e_mictorios", 
			collection: [
				"Bacias a vácuo",
				"Bacias dual flux",
				[:het, "HET – Vasos com consumo menor de 4 litros"],
				"Mictórios secos",
				"Mictório eficiente",
				[:mictorio_fechamento_hidromecanico, "Mictório com fechamento hidromecânico"],
				[:mictorio_fechamento_com_sensor_de_presenca, "Mictório com fechamento com sensor de presença"],
				[:outros, "Outros"]
			]
		}

		@radios_agua = [
				{
					input_method: :torneiras,
					label: "26. Torneiras",
					opcoes: ["Restritores de vazão", "Acionamento hidromecânico", "Sensor de presença"]
				},

				{
					input_method: :chuveiros,
					label: "27. Chuveiros",
					opcoes: ["Restritores de vazão"]
				},

				{
					input_method: :irrigacao,
					label: "28. Irrigação",
					opcoes: ["Irrigação automatizada"]
				},

				{
					input_method: :piscina,
					label: "29. Piscina",
					opcoes: ["Aquecimento solar para piscina"]
				}

			]

		@opcoes_agua = ["Para irrigação do paisagismo", "Para lavagem de pisos", "Para bacias", "Para ar condicionado", "Piscina", "Outros"]
		@fontes_de_agua = [
			{
				options: [:enable_disable],
				group_name: "Água Pluvial",
				prefix: "agua_pluvial", 
				input_method: :vrf,
				label: "Água Pluvial",
				collection: @opcoes_agua
			},
			{
				options: [:enable_disable],
				group_name: "Água de Lençol",
				prefix: "agua_de_lencol", 
				input_method: :vrf,
				label: "Água de Lençol",
				collection: @opcoes_agua
			},
			{
				options: [:enable_disable],
				group_name: "Água de Condensação",
				prefix: "agua_condensacao_tratada", 
				input_method: :vrf,
				label: "Água de Condensação",
				collection: @opcoes_agua
			},
			{
				options: [:enable_disable],
				group_name: "Água Cinza",
				prefix: "agua_cinza_tratada", 
				input_method: :vrf,
				label: "Água Pluvial",
				collection: @opcoes_agua
			},
			{
				options: [:enable_disable],
				group_name: "Água Negra",
				prefix: "agua_negra_tratada", 
				input_method: :vrf,
				label: "Água Pluvial",
				collection: @opcoes_agua
			},
		]


		@tipos_ar_condicionado = [
			{
				input_method: :vrf,
				label: "VRF"
			},
			{
				input_method: :central_de_agua_gelada,
				label: "Central de Água Gelada"
			}
		]

		@check_boxes_ar = [

			{
				options: [], 
				group_name: "34. Tratamento de ar externo",
				prefix: "tratamento_de_ar_externo", 
				collection: ["Roda entálpica", "Trocador de calor"]
			},
			{
				options: [], 
				group_name: "35. Variador de frequência",
				prefix: "variador_frequencia", 
				collection: ["Nos ventiladores de Tomadas de ar externos", "Nos Fan coils", "Nos Chillers"]
			},
			{
				options: [], 
				group_name: "36. Tipo de Insuflamento de ar",
				prefix: "tipo_de_insuflamento_de_ar", 
				collection: ["Teto", "Piso", "Vigas frias"]
			}
		]

		@vidros_energia_eletrica = 
			[
				{
					options: [], 
					group_name: "38. Vidros – Área envidraçada Insulado",
					prefix: "vidros_area_envidracada", 
					collection:
					[
						"Insulado",
						"Laminado",
						[:low_e, "Low-e (baixa emissividade)"],
						{
							parent_method: "da_fachada",
							parent_label: "Área envidraçada da fachada",
							children_type: :radio,
							children_method: "porcentagem",
							children:
							[
								"De 0% a 40%",
								"De 40% a 60%",
								"De 60% a 80%",
								"Mais de 80%",
							]
						}
					]
				},
				{
					options: [], 
					group_name: "39. Elétrica – Tamanho da entrada – Tipo de fonte de energia",
					prefix: "eletrica", 
					collection:
					[
						"Motor de alta eficiência",
						"Medição setorizada de consumo de energia",
						{
							parent_method: nil,
							parent_label: "Entrada de energia",
							children_type: :radio,
							children_method: "tipo",
							children:["Média","Alta"]
						},
						{
							parent_method: :fonte_de_energia,
							parent_label: "Fonte de energia",
							children_type: :check_box,
							children_method: nil,
							children: ["Elétrica", "Gás", "Outros"]
						},
						[:fonte_de_energia_outros, "Outros"]
					]
				},
				{

					options: [],
					group_name: "40. Energia alternativa",
					prefix: "energia_alternativa", 
					collection: ["Solar fotovoltaica", "Aquecimento solar de água", "Eólica", "Biomassa", "Outros"]
				}
			]

			@iluminacao_equipamentos = [
				{
					options: [], 
					group_name: "41. Tipo de iluminação – Área",
					prefix: "iluminacao", 
					collection:
					[
						{
							parent_method: :lampadas_t5,
							parent_label: "Lâmpadas T5",
							children_type: :check_box,
							children_method: nil,
							children: ["Área privativa", "Área comum"]

						},
						"Lâmpadas LED",
						"Integração da iluminação com a iluminação natural",
						"Dali",
						"Sensores de presença em áreas comuns",
						[:controles_acionamento_automatizado, "Controles de acionamento automatizado"],
						"Fotocélulas na iluminação externa",
						"Outros"
					]
				},
				{
					options: [], 
					group_name: "42. Equipamentos",
					prefix: "equipamentos", 
					collection: ["Elevadores eficientes", "Frenagem regenerativa", "ADC", "Outros"]
				}
			]

			@materiais_e_residuos_radios = [
				{
					method: :material_de_baixo_voc,
					name: "43. Material de baixo VOC",
					radios: ["Acabamentos", "Mobiliários"]
				},
				{
					method: :madeira_certificada, 
					name: "44. Madeira certificada",
					radios: ["Certificação Floor Score"]
				},
				{
					method: :pisos_e_carpetes_certificados, 
					name: "45. Pisos e carpetes certificados",
					radios: ["Depósito central","Depósito no pavimento"]
				}
			]

	end

end
