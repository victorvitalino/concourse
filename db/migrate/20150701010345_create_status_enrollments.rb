class CreateStatusEnrollments < ActiveRecord::Migration
  def change
    create_table :status_enrollments do |t|
      t.references :enrollment, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
