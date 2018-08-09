class AddCourseToApiusers < ActiveRecord::Migration[5.1]
  def change
    add_reference :apiusers, :course, foreign_key: true
  end
end
