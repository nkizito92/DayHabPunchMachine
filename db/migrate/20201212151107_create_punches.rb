class CreatePunches < ActiveRecord::Migration[6.0]
  def change
    create_table :punches do |t|
      t.integer :client_id
      t.string :clock_in
      t.string :clock_out
      t.string :date
    end
  end
end
