class CreateOrdenProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :orden_productos do |t|
      t.references :orden, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
