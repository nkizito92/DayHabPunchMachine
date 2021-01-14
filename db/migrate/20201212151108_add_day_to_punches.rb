class AddDayToPunches < ActiveRecord::Migration[6.0]
  def change
    add_column :punches, :month_day, :string
  end
end
