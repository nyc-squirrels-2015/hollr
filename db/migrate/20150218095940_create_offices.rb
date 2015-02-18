class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name, null: :false
      t.string :addr1, null: :false
      t.string :add2
      t.string :city, null: :false
      t.string :state, null: :false
      t.integer :zip, null: :false

      t.timestamps
    end
  end
end
