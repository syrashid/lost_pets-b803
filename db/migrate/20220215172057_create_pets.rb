class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :address
      t.integer :age
      t.string :species
      t.date :found_on

      t.timestamps
    end
  end
end
