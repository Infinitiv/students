class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :students, :moving_documents do |t|
      # t.index [:student_id, :moving_document_id]
      # t.index [:moving_document_id, :student_id]
    end
  end
end
