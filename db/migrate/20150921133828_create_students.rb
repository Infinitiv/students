class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :sex
      t.date :birth_date
      t.integer :region_code
      t.date :education_start_date
      t.string :education_start_place
      t.string :benefit_type
      t.references :target_organization, index: true, foreign_key: true
      t.string :source
      t.string :sitizenship
      t.references :educational_program, index: true, foreign_key: true
      t.integer :stage
      t.integer :group
      t.boolean :stage_leader, default: false
      t.boolean :group_leader, default: false
      t.references :status, index: true, foreign_key: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
