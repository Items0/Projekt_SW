class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.integer :user_id
      t.integer :training_id
      #t.datetime :data
      t.string :kind
      t.float :value
      t.timestamps
    end
  end
end
