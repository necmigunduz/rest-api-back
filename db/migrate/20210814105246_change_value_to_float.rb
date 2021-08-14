class ChangeValueToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :measurements, :value, :float
  end
end
