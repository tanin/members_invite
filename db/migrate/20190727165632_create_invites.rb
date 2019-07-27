class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.integer :member_id, null: false, index: true
      t.integer :group_id, null: false, index: true
      t.datetime :sent_at, index: true

      t.timestamps
    end
  end
end
