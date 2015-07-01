class CreateCodeMarcaEnrollments < ActiveRecord::Migration
  def change
    create_table :code_marca_enrollments do |t|
      t.string  :name
      t.references :candidate,  index: true
      t.references :enrollment, index: true
      t.timestamps null: false
    end
  end
end
