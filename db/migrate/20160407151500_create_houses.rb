class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
