class Student < ActiveRecord::Base
  belongs_to :target_organization
  belongs_to :educational_program
  belongs_to :status
  has_many :personal_documents
  has_many :moves, dependent: :destroy
  has_and_belongs_to_many :moving_documents
  has_and_belongs_to_many :user
  
  def self.import(file)
    accessible_attributes = column_names
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).to_a.in_groups_of(100, false) do |group|
      ActiveRecord::Base.transaction do
        group.each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          student = where(id: row["student_id"]).first || new
          student.attributes = row.to_hash.slice(*accessible_attributes)
          target_organization = TargetOrganization.find_by_name(row["target_organization_name"]) if row["target_organization_name"]
          status = Status.find_by_name(row["status"]) if row["status"]
          student.target_organization_id = target_organization.id if target_organization
          student.status_id = status.id if status
          student.save
        end
      end
    end
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".ods" then Roo::OpenOffice.new(file.path)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
  def fio
    [last_name, first_name, middle_name].compact.join(' ')
  end
end
