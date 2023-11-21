class CreateSpaces < ActiveRecord::Migration[7.1]
  def change
    create_table :spaces do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :price
      t.string :features
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
