class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :enrollment, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.text :content
      t.integer :message_type

      t.timestamps null: false
    end
  end
end
