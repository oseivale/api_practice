class AddKeyToEntries < ActiveRecord::Migration[5.2]
    def change
      change_table :entries do |t|
      t.integer :entry_id
    end
  end
end
