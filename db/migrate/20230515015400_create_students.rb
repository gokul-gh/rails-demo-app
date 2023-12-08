class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.date :date_of_birth
      t.string :roll_no
      t.references :department, null: false, foreign_key: true
      t.references :college, null: false, foreign_key: true

      t.timestamps
    end
  end
end
