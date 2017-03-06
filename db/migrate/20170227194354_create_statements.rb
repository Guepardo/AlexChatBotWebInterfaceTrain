class CreateStatements < ActiveRecord::Migration[5.0]
  def change
    create_table :statements do |t|
      t.text :text

      t.references :intent
      t.timestamps
    end
  end
end
