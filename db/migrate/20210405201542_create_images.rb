class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :user, null: true, foreign_key: true
      t.references :client, null: true, foreign_key: true
    end
  end
end
