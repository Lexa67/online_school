class AddTeacherIdToCourses < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :teacher, foreign_key: true
  end
end
