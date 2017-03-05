class CreateReferralothercounsellings < ActiveRecord::Migration[5.0]
  def change
    create_table :referralothercounsellings, {:id => false }  do |t|
      t.string :id, limit: 1, primary_key: true
      t.string :text

      t.timestamps
    end
  end
end
