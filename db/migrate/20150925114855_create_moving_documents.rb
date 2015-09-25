class CreateMovingDocuments < ActiveRecord::Migration
  def change
    create_table :moving_documents do |t|
      t.string :name
      t.string :number
      t.date :date
      t.string :type
      t.string :mime_type
      t.binary :data
      t.text :content

      t.timestamps null: false
    end
  end
end
