class CreateInsurancestatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :insurancestatuses, {:id => false }  do |t|
      t.string :id, limit: 1, primary_key: true
      t.string :text

      t.timestamps
    end
  end
end
