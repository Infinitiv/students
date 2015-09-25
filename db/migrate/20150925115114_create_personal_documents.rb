class CreatePersonalDocuments < ActiveRecord::Migration
  def change
    create_table :personal_documents do |t|
      t.string :name
      t.string :number
      t.date :date
      t.string :mime_type
      t.binary :data
      t.binary :thumbnail
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
