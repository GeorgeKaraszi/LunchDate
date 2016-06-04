class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :twitter, null:false
      t.string :facebook
      t.string :linkedin

      t.timestamps null: false
    end
  end
end
