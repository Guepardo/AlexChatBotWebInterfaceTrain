class CreateDialogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dialogs do |t|
      t.string :name
      t.integer :dialog_id

      t.references :topic
      t.timestamps
    end
  end
end
