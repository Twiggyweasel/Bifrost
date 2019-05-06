class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :primary_phone
      t.string :secondary_phone
      t.boolean :is_primary, default: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
