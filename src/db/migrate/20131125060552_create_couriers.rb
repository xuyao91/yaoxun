class CreateCouriers < ActiveRecord::Migration
  def change
    create_table :couriers do |t|
      t.integer :wx_user_id, null: false
      t.string  :odd_num
      t.timestamps
    end
  end
end
