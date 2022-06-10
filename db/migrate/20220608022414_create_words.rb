class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.text :word
      t.references :user, null: false, foreign_key: true
      t.timestamp :updated
      t.timestamp :deleted

      t.timestamps
    end
  end
end
