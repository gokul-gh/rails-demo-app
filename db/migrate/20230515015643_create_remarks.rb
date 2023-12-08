class CreateRemarks < ActiveRecord::Migration[6.1]
  def change
    create_table :remarks do |t|
      t.string :remark_detail
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
