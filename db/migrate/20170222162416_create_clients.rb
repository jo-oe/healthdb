class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :code, limit: 8
      t.string :lastname
      t.string :firstname
      t.date :birthdate
      t.belongs_to :sex, foreign_key: true
      t.belongs_to :homeplace, foreign_key: true
      t.belongs_to :citizenship, foreign_key: true
      t.belongs_to :legalstatus, foreign_key: true
      t.belongs_to :familystatus, foreign_key: true
      t.integer :childrencount
      t.date :datefirstcontact
      t.belongs_to :referrer, foreign_key: true
      t.string :referrerfreetext

      t.timestamps
    end
    add_index :clients, :code, unique: true
  end
end
