class ChangeTypeMeasurements < ActiveRecord::Migration[6.1]
  def change
    remove_column :measurements, :value
    add_column :measurements, :value, :decimal, :precision => 6, :scale => 2, null: false
  end
end
