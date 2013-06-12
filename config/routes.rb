SimObrasSustentaveis::Application.routes.draw do
  root to: "pages#login"
  get ":action" => "pages"
end