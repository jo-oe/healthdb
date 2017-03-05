class CreateCitizenships < ActiveRecord::Migration[5.0]
  def change
    create_table :citizenships, {:id => false } do |t|
      t.string :id, limit: 3, primary_key: true
      t.string :name

      t.timestamps
    end
    add_index :citizenships, :id, unique: true
  end
end
