class CreateIntents < ActiveRecord::Migration[5.0]
  def change
    create_table :intents do |t|
      t.string :name
      t.text :description
      t.integer :dialog_id, :null => true

      t.references :bot
      t.timestamps
    end
  end
end
