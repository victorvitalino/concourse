class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.string  :name
      t.string  :description
      t.string  :logo
      t.string  :header
      t.string  :footer
      t.date    :start
      t.date    :end
      t.boolean :status
      
      t.timestamps null: false
    end
  end
end
