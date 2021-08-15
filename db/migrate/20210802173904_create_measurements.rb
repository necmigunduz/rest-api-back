class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.string :value
      t.integer :unit_id

      t.timestamps
    end
  end
end
