class CreateCandidateEnrollments < ActiveRecord::Migration
  def change
    create_table :candidate_enrollments do |t|
      t.references :enrollment, index: true, foreign_key: true
      t.references :candidate,  index: true, foreign_key: true
      t.integer    :form_id,    index: true
      t.string     :form_type,  index: true
      t.integer    :status, default: 1

      t.timestamps null: false
    end
  end
end
