class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :title, index: true, null: false
      t.string :comment 
      t.references :genre, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
