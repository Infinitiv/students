class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy, :edit]
  before_action :student_params, only: [:create]
  before_action :options_for_select

  def index
    @students = Student.includes(:educational_program, :target_organization).order(:educational_program_id, :stage, :group, :last_name, :first_name, :middle_name).group_by(&:educational_program_id)
    @educational_programs = Hash.new
    EducationalProgram.select(:id, :name, :standart).map{|e| @educational_programs[e.id] = [e.name, e.standart].compact.join(" ")}
    @moving_document = MovingDocument.new
    @statuses = Status.order(:name)
  end
  
  def show
    
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render action: 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @student.update(student_params)
      redirect_to @student
    else
      render action: 'edit'
    end    
  end
  
  def destroy
    @student.destroy
    redirect_to students_path    
  end
  
  def import
    Student.import(params[:file])
    redirect_to students_url, notice: "Students imported."
  end
  
  private
  
  def set_student
    @student = Student.includes(:educational_program, :status, :target_organization, :personal_documents, :moving_documents).find(params[:id])  
  end
  
  def student_params
    params.require(:student).permit(:id, :first_name, :middle_name, :last_name, :sex, :birth_date, :region_code, :education_start_date, :education_start_place, :benefit_type, :target_organization_id, :source, :sitizenship, :educational_program_id, :stage, :group, :stage_leader, :group_leader, :status_id, :comment)
  end
  
  def options_for_select
    @target_organizations = TargetOrganization.order(:name)
    @educational_programs = EducationalProgram.order(:name)
    @statuses = Status.order(:name)
  end
end