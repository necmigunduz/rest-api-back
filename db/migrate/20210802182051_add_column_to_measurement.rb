class AddColumnToMeasurement < ActiveRecord::Migration[6.1]
  def change
    add_column :measurements, :user_id, :integer
  end
end
