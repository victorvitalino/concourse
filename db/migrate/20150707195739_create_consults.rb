class CreateConsults < ActiveRecord::Migration
  def change
    create_table :consults do |t|
      t.references :project, index: true, foreign_key: true
      t.string :title
      t.references :content, index: true, foreign_key: true
      t.string :email

      t.timestamps null: false
    end
  end
end
