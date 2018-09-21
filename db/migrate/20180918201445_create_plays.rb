class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.string :image_name
      t.string :image_url
      t.timestamps
    end
  end
end
