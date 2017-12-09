class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.string :kind
      t.float :value
      t.integer :user_id
      t.timestamps
    end
  end
end
