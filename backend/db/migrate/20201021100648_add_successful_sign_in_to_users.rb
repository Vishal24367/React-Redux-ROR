class AddSuccessfulSignInToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :successfulSignIn, :boolean, default: false
  end
end
