class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :ticket_number
      t.string :request_summary
      t.text :request_detail
      t.string :outcome_summary
      t.text :outcome_detail
      t.datetime :due
      t.datetime :resolved
      t.datetime :last_response
      t.integer :severity
      t.integer :status
      t.references :client, foreign_key: true
      
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
