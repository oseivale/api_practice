class AddImageId < ActiveRecord::Migration[5.2]
  def change
    change_table :plays do |t|
    t.integer :image_id
    end
  end
end
