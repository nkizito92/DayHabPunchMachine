class CreatePunches < ActiveRecord::Migration[6.0]
  def change
    create_table :punches do |t|
      t.integer :client_id
      t.datetime :clock_in
      t.datetime :clock_out
    end
  end
end
