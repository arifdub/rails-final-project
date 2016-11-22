class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :category

      t.timestamps null: false
    end
  end
end
