SimObrasSustentaveis::Application.routes.draw do
  root to: "pages#home"
  get ":action" => "pages"
end