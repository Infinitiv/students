class ReportsController < ApplicationController
  
  def contingent 
    @students = Student.select(:sex, :benefit_type, :target_organization_id, :source, :sitizenship, :educational_program_id, :stage, :status_id)
    @medical_faculty = [1, 3]
    @pediatric_faculty = [2, 4]
    @stomat_faculty = [5]
    @budget = 'федеральный бюджет'
    @commercial = 'средства физических и юридических лиц'
    @stages = Student.select(:stage).map(&:stage).uniq.sort
    @russia = 'Российская Федерация'
  end
  
  def missing_data
    students = Student.includes(:educational_program)
    @sexless = students.where(sex: nil)
    @stateless = students.where(sitizenship: nil)
    @statusless = students.where(status_id: nil)
    @sourceless = students.where(source: nil)
    @stageless = students.where(stage: nil)
    @groupless = students.where(group: nil)
    @educational_program_less = students.where(educational_program_id: nil, status_id: [1, 3])
  end
end