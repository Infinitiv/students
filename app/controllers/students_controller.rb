class StudentsController < ApplicationController
  before_action :set_student, only: [:show]
  def index
    @students = Student.includes(:educational_program, :target_organization).sort_by(&:fio).group_by(&:educational_program_id)
    @educational_programs = Hash.new
    EducationalProgram.select(:id, :name).map{|e| @educational_programs[e.id] = e.name}
    @moving_document = MovingDocument.new
  end
  
  def show
    
  end
  
  def import
    Student.import(params[:file])
    redirect_to students_url, notice: "Students imported."
  end
  
  private
  
  def set_student
    @student = Student.includes(:educational_program, :status, :target_organization, :personal_documents, :moving_documents).find(params[:id])  
  end
end