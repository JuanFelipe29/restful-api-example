class CreateOrdens < ActiveRecord::Migration[7.1]
  def change
    create_table :ordens do |t|
      t.string :estado
      t.decimal :total

      t.timestamps
    end
  end
end
