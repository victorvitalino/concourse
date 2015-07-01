class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
      t.references :candidate, index: true, foreign_key: true
      t.references :enrollment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
