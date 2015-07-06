class CreateFormMarcaEnrollments < ActiveRecord::Migration
  def change
    create_table :form_marca_enrollments do |t|
      t.string  :digital_rg
      t.string  :digital_voter
      t.string  :digital_check_voter

      t.timestamps null: false
    end
  end
end
