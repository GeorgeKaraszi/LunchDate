class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :buyer, index:true
      t.references :consumer, index:true
      t.date :day_of_month, foreign_key: true

      t.timestamps null: false
    end
  end
end
