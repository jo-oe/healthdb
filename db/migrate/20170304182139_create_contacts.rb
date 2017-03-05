class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :client, type: :string, limit: 8, foreign_key: true
      t.date :contactdate
      t.belongs_to :counsellor, class_name: "User"
      t.belongs_to :contactreason, type: :string, limit: 1, foreign_key: true
      t.string :contactreasonfreetext
      t.belongs_to :insurancestatus, type: :string, limit: 1, foreign_key: true
      t.belongs_to :counselledperson, type: :string, limit: 1, class_name: "Counselledpersons"
      t.belongs_to :translatorused, type: :string, limit: 1, foreign_key: true
      t.boolean :has_insuranceproblem
      t.boolean :has_paymentproblem
      t.boolean :has_housingproblem
      t.boolean :has_workproblem
      t.boolean :has_psychosocialproblem
      t.boolean :has_healthproblem
      t.belongs_to :insuranceproblem, type: :string, limit: 1, foreign_key: true
      t.belongs_to :healthproblem, type: :string, limit: 1, foreign_key: true
      t.belongs_to :referral, type: :string, limit: 1, foreign_key: true
      t.belongs_to :referralcaritas, type: :string, limit: 1, foreign_key: true
      t.belongs_to :referraldiakonie, type: :string, limit: 1, foreign_key: true
      t.belongs_to :referralothercounselling, type: :string, limit: 1, foreign_key: true
      t.belongs_to :referralmedical, type: :string, limit: 1, foreign_key: true
      t.belongs_to :referralauthority, type: :string, limit: 1, foreign_key: true
      t.belongs_to :successfulinsurance, type: :string, limit: 1, foreign_key: true
      t.belongs_to :failedinsurance, type: :string, limit: 1, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
