class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.text :product_name
      t.string :image_id
      t.text :explanation
      t.integer :admin_id

      t.timestamps
    end
  end
end
