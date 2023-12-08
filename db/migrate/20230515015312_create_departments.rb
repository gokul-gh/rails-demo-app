class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :department_code
      t.references :college, null: false, foreign_key: true

      t.timestamps
    end
  end
end
