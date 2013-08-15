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
		@passos = Construction.passos
		params[:passo] = @passos.first.parameterize.underscore if params[:passo].nil?
	end

end
