class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.string :uuid, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
