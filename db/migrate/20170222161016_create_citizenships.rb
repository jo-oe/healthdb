class CreateCitizenships < ActiveRecord::Migration[5.0]
  def change
    create_table :citizenships do |t|
      t.string :iso3166, limit: 3
      t.string :name

      t.timestamps
    end
    add_index :citizenships, :iso3166, unique: true
  end
end
