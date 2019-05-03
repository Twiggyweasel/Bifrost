class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :status
      t.integer :service_type
      t.integer :payment_method
      t.datetime :onboard_date
      t.datetime :offboard_date
      t.datetime :recent_request_date
      t.boolean :account_current, default: true

      t.timestamps
    end
  end
end
