class ConstructionsController < ApplicationController
	before_action :authenticate_admin!, :set_variables
	def structure
		require "yaml"
		render json: (YAML.load_file Rails.root.join "app", "models", "data_structure.yml")
	end

	def new
		@obra = Construction.new
	end
	

	def create
		@obra = Construction.new(dados: params[:construction])
		@pagina = @passos.collect(&:parameterize).collect(&:underscore).index(@passo)
		@passo_index = @passos.collect(&:parameterize).collect(&:underscore).index(params[:construction][:passo])
		
		if @obra.save
			log current_admin, "Adicionou obra", @obra.nome_da_obra
			if params["commit"] == "Salvar e sair" or params[:construction][:passo]=="materiais_e_residuos"
				redirect_to action: "index"
			else
				redirect_to action: "edit", id: @obra.id, passo: @passos[@passo_index+1].parameterize.underscore
			end
		else
			render action: :new, passo: @passos[@passo_index].parameterize.underscore
		end
	end

	def show
		@obra = Construction.find(params[:id])
		@table = @obra.dados.map do |key, value|
			if !value.blank?
				[key] << case value
					when "1" then "Sim"
					when "0" then "Não"
					else value
				end
			end
		end
		@table = [@table.compact]
	end

	def index
		@obras = Construction.order(:created_at)
		respond_to do |f|
			f.html 	{render}
			f.xls 	{
				send_data @obras.to_csv(col_sep: "\t").to_s.encode!("windows-1252"), type: "application/xls;charset=windows-1252", filename:"lista-de-obras-#{I18n.l(Time.now, format: :short).parameterize}.xls"
			}
		end
	end

	def edit
		@obra = Construction.find(params[:id])
	end

	def destroy
		@obra = Construction.find(params[:id])
		@obra.destroy
		log current_admin, "Apagou obra", @obra.nome_da_obra
		
		redirect_to action: "index"
	end

	def update
		@obra = Construction.find(params[:id])
		@obra.update_attributes(dados: params[:construction])
		log current_admin, "Editou obra", @obra.nome_da_obra
		
		@passo_index = @passos.collect(&:parameterize).collect(&:underscore).index(params[:construction][:passo])
		
		if params["commit"] == "Salvar e sair" or params[:construction][:passo]=="materiais_e_residuos"
			redirect_to action: "index"
		else
			redirect_to action: "edit", passo: @passos[@passo_index+1].parameterize.underscore
		end
	end

	protected

	def set_variables
		@passos = ["ficha técnica", "certificação", "terreno", "água", "energia", "fachada", "materiais e resíduos"]
		params[:passo] = @passos.first.parameterize.underscore if params[:passo].nil?

		@groups_checkboxes_certificacao = [
			{
				options: [], 
				group_name: "16. Sistema",
				prefix: "sistema", 
				collection: ["LEED", "Aqua", "Procel Edifica", "Qualiverde", "Bream", "DGNB", "LBC", "Outros"]
			},
			{
				options: [], 
				group_name: "17. Tipo de sistema",
				prefix: nil, 
				collection: ["LEED NC", "LEED CS", "LEED CI", "LEED EB", [:aqua_bairros, "Aqua Bairros e loteamentos"], [:aqua_edificios, "Aqua Edifícios Habitacionais"], "Aqua Serviços", "Aqua Operação e Uso", "Procel Residencial", "Procel Comercial", [:tipo_de_sistema_outros, "Outros"]]
			}
		]

		@boolean_radios_terreno = [
			[:vagas_verdes, "20. Vagas verdes"],
			[:estacoes_de_recarga_de_veiculos_eletricos, "21. Estações de recarga de veículos elétricos"],
			[:bicicletarios, "22. Bicicletários"],
			[:vestiarios_com_chuveiro, "23. Vestiários com chuveiro"]
		]

		@transportes_publicos = {
			options: [:intercalar_distancia_aproximada], 
			group_name: "24. Transporte público",
			prefix: "proximidade_ao_tpublico", 
			collection: ["Metro", "Trem", "Ponto de ônibus", "Outros"]
		}

		@ilhas_de_calor = { 
			options: [],
			group_name: "25. Como você está reduzindo o efeito de ilhas de calor no empreendimento?",
			prefix: "como_esta_reduzindo_ilhas_de_calor", 
			collection: [[:alta_refletancia, "Alta refletância solar"], "Telhado verde", "Vagas Cobertas", "Piso Concregama", "Outros"]
		}


		@torneiras = {
			options: [], 
			group_name: "27. Torneiras",
			prefix: "torneiras", 
			collection: [
				"Restritores de vazão",
				"Acionamento hidromecânico",
				"Sensor de presença",
				"Regulador de vazão",
				[:outros, "Outros"]
			]
		}

		@bacias_mictorios = {
			options: [], 
			group_name: "26. Bacias e Mictorios",
			prefix: "bacias_e_mictorios", 
			collection: [
				"Bacias a vácuo",
				"Bacias dual flux",
				[:het, "HET – Vasos com consumo menor de 4 litros"],
				"Mictórios secos",
				[:mictorio_fechamento_hidromecanico, "Mictório com fechamento hidromecânico"],
				[:mictorio_fechamento_com_sensor_de_presenca, "Mictório com fechamento com sensor de presença"],
				[:outros, "Outros"]
			]
		}

		@radios_agua = [

				{
					input_method: :chuveiros,
					label: "28. Chuveiros",
					opcoes: ["Restritores de vazão", 
					"Chuveiros eficientes (com baixa vazão e tecnologia incorporada para aumento de sensação da pressão)"]
				},

				{
					input_method: :irrigacao,
					label: "29. Irrigação",
					opcoes: ["Irrigação automatizada",
						"Sensor de chuva",
						"Sensor de umidade do solo",
						"Estação meteorological"]
				},


				{
					input_method: :piscina,
					label: "30. Piscina",
					opcoes: ["Aquecimento solar para piscina"]
				}
			]

		@opcoes_agua = [
			"Para irrigação do paisagismo", 
			"Para lavagem de pisos", 
			[:para_bacias,"Para bacias e mictórios"], 
			"Outros"
		]
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

		@drenagem = {
				options: [],
				group_name: "34. Drenagem",
				prefix: "drenagem", 
				input_method: :drenagem,
				collection: [
					"Pisos permeáveis",
					"Caixa de retardo",
					[:remocao_de_solidos_suspensos, "Remoção de sólidos suspensos – Filtros Vortex"],
					"Captação e aproveitamente de água pluvial",
					"Outros"
				]
			}

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
				group_name: "36. Ar externo",
				prefix: "tratamento_de_ar_externo", 
				collection: ["Roda entálpica", "Trocador de calor", [:controle_de_demanda_de_ventilacao_por_, "Controle de demanda de ventilação por CO2"]]
			},
			{
				options: [], 
				group_name: "37. Tipo de Insuflamento de ar",
				prefix: "tipo_de_insuflamento_de_ar", 
				collection: ["Teto", "Piso", "Vigas frias"]
			}
		]

		@check_boxes_ar.map{|a|a[:collection]<<"Outros"}

		@vidros_energia_eletrica = 
			[
				# {
				# 	options: [], 
				# 	group_name: "38. Vidros – Área envidraçada",
				# 	prefix: "vidros_area_envidracada", 
				# 	collection:
				# 	[
				# 		"Insulado",
				# 		"Laminado",
				# 		[:low_e, "Low-e (baixa emissividade)"],
				# 		{
				# 			parent_method: "da_fachada",
				# 			parent_label: "Área envidraçada da fachada",
				# 			children_type: :radio,
				# 			children_method: "porcentagem",
				# 			children:
				# 			[
				# 				"De 0% a 40%",
				# 				"De 40% a 60%",
				# 				"De 60% a 80%",
				# 				"Mais de 80%",
				# 			]
				# 		},
				# 		"Outros"
				# 	]
				# },
				# {
				# 	options: [], 
				# 	group_name: "39. Elétrica – Tamanho da entrada – Tipo de fonte de energia",
				# 	prefix: "eletrica", 
				# 	collection:
				# 	[
				# 		"Motor de alta eficiência",
				# 		"Medição setorizada de consumo de energia",
				# 		{
				# 			parent_method: nil,
				# 			parent_label: "Entrada de energia",
				# 			children_type: :radio,
				# 			children_method: "tipo",
				# 			children:["Média","Alta"]
				# 		},
				# 		{
				# 			parent_method: :fonte_de_energia,
				# 			parent_label: "Fonte de energia",
				# 			children_type: :check_box,
				# 			children_method: nil,
				# 			children: ["Elétrica", "Gás", "Outros"]
				# 		},
				# 		[:fonte_de_energia_outros, "Outros"]
				# 	]
				# },
				{

					options: [],
					group_name: "41. Energia alternativa",
					prefix: "energia_alternativa", 
					collection: ["Solar fotovoltaica", "Aquecimento solar de água", "Eólica", "Biomassa", "Outros"]
				}
			]

			@iluminacao_equipamentos = [
				{
					options: [], 
					group_name: "44. Tipo de iluminação – Área",
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
					group_name: "45. Equipamentos",
					prefix: "equipamentos", 
					collection: ["Elevadores eficientes", "Frenagem regenerativa", "ADC", "Outros"]
				}
			]

			@materiais_e_residuos_radios = [
				{
					method: :material_de_baixo_voc,
					name: "46. Material de baixo VOC",
					radios: ["Tintas", "Adesivos"]

				},
				{
					method: :madeira_certificada, 
					name: "47. Madeira certificada",
					radios: ["Acabamentos", "Mobiliários"]
				},
				{
					method: :pisos_e_carpetes_certificados, 
					name: "48. Pisos e carpetes certificados",
					radios: ["Certificação Floor Score"]
				}
			]
			@materiais_checkboxes = [
				{
					options: [],
					group_name: "49. Infraestrutura para coleta de resíduos recicláveis",
					prefix: "coleta_de_residuos_reciclaveis", 
					collection: ["Depósito central", "Depósito no pavimento", "Outros"]
				},
				{
					options: [],
					group_name: "50. Qualidade Ambiental (Ar) – Nível de filtragem",
					prefix: "coleta_de_residuos_reciclaveis", 
					collection: 
					[
						{
							parent_method: :nivel_de_filtragem,
							parent_label: "Nível de Filtragem",
							children_type: :radio,
							children_method: "tipo",
							children: ["F5", "F7"]

						},
						[:sistema_trat_ar_interno, "Sistemas de tratamento de ar interno"],
						[:nivel_filtragem, "Outros"]
					]
				}

			]


	end

end
