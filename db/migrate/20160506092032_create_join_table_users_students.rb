class CreateJoinTableUsersStudents < ActiveRecord::Migration
  def change
    create_join_table :users, :students do |t|
      # t.index [:user_id, :student_id]
      # t.index [:student_id, :user_id]
    end
  end
end
