class CreateWxUsers < ActiveRecord::Migration
  def change
    create_table :wx_users do |t|
      t.string :uid, null: false, comment: '微信普通用户(to_user_name)'
      t.string :location_x
      t.string :location_y
      t.datetime :location_updated_at
      t.string :location_label
      t.string :tel
      t.string :address
      t.timestamps
    end
  end
end
