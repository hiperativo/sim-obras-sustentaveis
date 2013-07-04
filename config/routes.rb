SimObrasSustentaveis::Application.routes.draw do
	devise_for :admins, path_prefix: "my"
	resources :logs
	resources :admins
	resources :constructions, path: "obras", path_names: { new: "novo-cadastro-de-obra"}
	root to: "constructions#index"
	get ":action" => "pages"
end