class CreateNodes < ActiveRecord::Migration[6.1]
  def change
    create_table :nodes do |t|
      t.string :label
      t.integer :parent_id
      t.references :tree, null: false, foreign_key: true

      t.timestamps
    end
  end
end
