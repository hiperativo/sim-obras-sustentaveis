SimObrasSustentaveis::Application.routes.draw do
  root to: "pages#index"
  get ":action" => "pages"
end