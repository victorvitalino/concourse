class CreateUserProjectPrivileges < ActiveRecord::Migration
  def change
    create_table :user_project_privileges do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
