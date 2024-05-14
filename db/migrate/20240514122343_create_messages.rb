class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.string :file

      t.timestamps
    end
  end
end
