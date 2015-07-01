class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name
      t.string :slug, unique: true
      t.text  :content
      t.boolean :status
      t.timestamps null: false
    end
  end
end
