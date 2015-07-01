class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :project, index: true, foreign_key: true
      t.string  :name
      t.text    :description   
      t.date    :start   
      t.date    :end   
      t.boolean   :status
      t.string  :code, unique: true
      t.boolean :fee
      t.float :fee_value
      t.text  :content_mail   
      t.timestamps null: false
    end
  end
end
