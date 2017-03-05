class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients, {:id => false }  do |t|
      t.string :id, limit: 8, primary_key: true
      t.string :lastname
      t.string :firstname
      t.date :birthdate
      t.belongs_to :sex, type: :string, limit: 1, foreign_key: true
      t.belongs_to :homeplace, type: :string, limit: 1,  foreign_key: true
      t.belongs_to :citizenship, type: :string, limit: 3,  foreign_key: true
      t.belongs_to :legalstatus, type: :string, limit: 1,  foreign_key: true
      t.belongs_to :familystatus, type: :string, limit: 1,  foreign_key: true
      t.integer :childrencount
      t.date :datefirstcontact
      t.belongs_to :referrer, type: :string, limit: 1, foreign_key: true
      t.string :referrerfreetext

      t.timestamps
    end
  end
end
