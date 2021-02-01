class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.references :semester, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
