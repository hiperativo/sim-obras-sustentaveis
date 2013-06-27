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
				intercalar_distancia_aproximada: false,
				group_name: "15. Sistema",
				prefix: "sistema", 
				collection: ["LEED", "Aqua", "Procel Edifica", "Qualiverde", "Bream", "DGNB", "LBC", "Outros"]
			},
			{
				intercalar_distancia_aproximada: false,
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
				intercalar_distancia_aproximada: true,
				group_name: "23. Transporte público",
				prefix: "proximidade_ao_tpublico", 
				collection: ["Metro", "Trem", "Ponto de ônibus", "Outros"]
			}

		@bacias_mictorios = {
			intercalar_distancia_aproximada: false,
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
	end

end
