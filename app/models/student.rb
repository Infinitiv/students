class Student < ActiveRecord::Base
  belongs_to :target_organization
  belongs_to :educational_program
  belongs_to :status
end
