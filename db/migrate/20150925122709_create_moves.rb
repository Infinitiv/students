class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :next_status_id
      t.integer :previous_status_id
      t.references :moving_document, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
