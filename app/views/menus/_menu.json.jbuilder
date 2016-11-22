json.extract! menu, :id, :title, :description, :price, :image_url, :category, :created_at, :updated_at
json.url menu_url(menu, format: :json)