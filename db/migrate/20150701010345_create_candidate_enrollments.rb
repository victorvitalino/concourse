class CreateCandidateEnrollments < ActiveRecord::Migration
  def change
    create_table :candidate_enrollments do |t|
      t.references :enrollment, index: true, foreign_key: true
      t.references :candidate,  index: true, foreign_key: true
      t.integer    :enrollment_id,    index: true
      t.string     :enrollment_type,  index: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
