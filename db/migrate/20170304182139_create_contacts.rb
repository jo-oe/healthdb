class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :client, foreign_key: true
      t.date :contactdate
      t.belongs_to :user, foreign_key: "counsellor_id"
      t.belongs_to :contactreason, foreign_key: true
      t.string :contactreasonfreetext
      t.belongs_to :insurancestatus, foreign_key: true
      t.belongs_to :counselledpersons, foreign_key: true
      t.belongs_to :translatorused, foreign_key: true
      t.boolean :has_insuranceproblem
      t.boolean :has_paymentproblem
      t.boolean :has_housingproblem
      t.boolean :has_workproblem
      t.boolean :has_psychosocialproblem
      t.boolean :has_healthproblem
      t.belongs_to :insuranceproblem, foreign_key: true
      t.belongs_to :healthproblem, foreign_key: true
      t.belongs_to :referral, foreign_key: true
      t.belongs_to :referralcaritas, foreign_key: true
      t.belongs_to :referraldiakonie, foreign_key: true
      t.belongs_to :referralothercounselling, foreign_key: true
      t.belongs_to :referralmedical, foreign_key: true
      t.belongs_to :referralauthority, foreign_key: true
      t.belongs_to :successfulinsurance, foreign_key: true
      t.belongs_to :failedinsurance, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
