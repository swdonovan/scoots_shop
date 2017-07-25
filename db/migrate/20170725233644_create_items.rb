class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.text :image, default: "https://jetimages.azureedge.net/md5/ad0fa3578baeba1eefdc2579ffe862f3.500"
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
