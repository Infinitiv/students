class CreateTargetOrganizations < ActiveRecord::Migration
  def change
    create_table :target_organizations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
