class AdminsController < ApplicationController
	before_filter :autenticar_super_admin?, except: [:edit, :update]
	def index
	end

	def new
		@admin = Admin.new
	end

	def edit
		@admin = Admin.find params[:id]
		autenticar_super_admin? unless current_admin == @admin
	end

	def update
		@admin = Admin.find params[:id]
		
		if current_admin == @admin
			@admin.update_attributes(params[:admin].delete(:role))
			log current_admin, "Atualizou cadastro", @admin.name
			
			redirect_to "/"
		else
			autenticar_super_admin?	
			@admin.update_attributes params[:admin]
			redirect_to action: :index
		end

	end

	def create
		def create_admin
			@admin = Admin.new(params[:admin])
			if @admin.valid?
				@admin.save
				log current_admin, "Cadastrou novo usuário", @admin.name
			else
				@admin
			end
		end

		case params[:commit]
		when "Gravar"
			create_admin
			if @admin.errors.any?
				flash[:error] = "Corrija os erros abaixo e tente novamente."
				render action: :new
			else 
				flash[:success] = "Usuário criado com sucesso"
				redirect_to action: :index
			end

		when "Gravar e criar outro"
			create_admin
			if @admin.errors.any?
				flash[:error] = "Corrija os erros abaixo e tente novamente."
				@admin = Admin.new
				render action: :new
			else
				flash[:success] = "Usuário criado com sucesso"
				redirect_to action: :index
			end

		else
			redirect_to action: :index
		end

	end

	def destroy
		@admin = Admin.find params[:id]
		autenticar_super_admin? unless current_admin == @admin
		@admin.destroy
		log current_admin, "Apagou usuário", @admin.name
		redirect_to action: :index
	end
end
