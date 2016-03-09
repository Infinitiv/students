class StudentsController < ApplicationController
  before_action :set_student, only: [:show]
  def index
    @students = Student.includes(:educational_program, :target_organization).order(:educational_program_id, :stage, :group, :last_name, :first_name, :middle_name).group_by(&:educational_program_id)
    @educational_programs = Hash.new
    EducationalProgram.select(:id, :name, :standart).map{|e| @educational_programs[e.id] = [e.name, e.standart].compact.join(" ")}
    @moving_document = MovingDocument.new
    @statuses = Status.order(:name)
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