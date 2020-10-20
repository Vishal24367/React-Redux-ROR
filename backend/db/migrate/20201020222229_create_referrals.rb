class CreateReferrals < ActiveRecord::Migration[5.2]
  def change
    create_table :referrals do |t|
      t.references :user, foreign_key: true
      t.integer :count, default: 0
      t.string :code, index: true
      
      t.timestamps
    end
  end
end
