class CreateNavs < ActiveRecord::Migration
  def change
    create_table :navs do |t|
      t.references :project, index: true, foreign_key: true
      t.string  :name
      t.integer :nav_type
      t.references :page, index: true
      t.integer :target
      t.boolean :status
      t.integer :order, default: 0
      t.string  :url
      
      t.timestamps null: false
    end
  end
end
