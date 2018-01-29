class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.string :username
      t.integer :trainingID
      t.float :longtitude
      t.float :latitude
      t.datetime :myDate
      t.timestamps
    end
  end
end
