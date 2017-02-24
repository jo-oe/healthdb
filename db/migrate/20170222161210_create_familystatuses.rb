class CreateFamilystatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :familystatuses do |t|
      t.string :code, limit: 1
      t.string :text

      t.timestamps
    end
  end
end
