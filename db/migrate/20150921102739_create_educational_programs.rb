class CreateEducationalPrograms < ActiveRecord::Migration
  def change
    create_table :educational_programs do |t|
      t.string :name
      t.string :level
      t.string :standart

      t.timestamps null: false
    end
  end
end
