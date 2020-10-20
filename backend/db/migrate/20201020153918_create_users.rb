class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email, index: true
      t.string :phoneNumber, index: true
      t.string :referredCodeKey
      t.boolean :agreeToPrivacyPolicy
      t.string :token, index: true
      t.string :source
      t.integer :wrongOTPCount, default: 0
      t.integer :wrongEmailVerificationCount, default: 0
      t.timestamps
    end
  end
end
