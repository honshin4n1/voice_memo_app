class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.string :name, index: true, null: false
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
