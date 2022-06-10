class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :user_name
      t.text :email
      t.text :password
      t.integer :permission, default: 0

      t.timestamps
    end
  end
end
