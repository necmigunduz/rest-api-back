class AddDefaultToValue < ActiveRecord::Migration[6.1]
  def change
    change_column :measurements, :value, :float, :default => 0
  end
end
