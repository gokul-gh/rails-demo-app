class CreateAreaOfInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :area_of_interests do |t|
      t.string :name

      t.timestamps
    end
  end
end
