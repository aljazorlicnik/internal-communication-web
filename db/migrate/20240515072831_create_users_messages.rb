class CreateUsersMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :users_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
