class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy, :edit, :male, :female]
  before_action :student_params, only: [:create]
  before_action :options_for_select

  def index
    authorize! :read, Student
    if current_user.dean?
      @students = current_user.students.includes(:educational_program, :target_organization).order(:educational_program_id, :stage, :group, :last_name, :first_name, :middle_name).group_by(&:educational_program_id)
    else
      @students = Student.includes(:educational_program, :target_organization).order(:educational_program_id, :stage, :group, :last_name, :first_name, :middle_name).group_by(&:educational_program_id)
    end
    @educational_programs = Hash.new
    EducationalProgram.select(:id, :name, :standart).map{|e| @educational_programs[e.id] = [e.name, e.standart].compact.join(" ")}
    @moving_document = MovingDocument.new
    @statuses = Status.order(:name)
  end
  
  def show
    authorize! :read, @student
  end
  
  def new
    @student = Student.new
    authorize! :create, @student
  end
  
  def create
    authorize! :create, @student
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render action: 'new'
    end
  end
  
  def edit
    authorize! :update, @student
  end
  
  def update
    authorize! :update, @student
    if @student.update(student_params)
      redirect_to @student
    else
      render action: 'edit'
    end    
  end
  
  def destroy
    authorize! :destroy, @student
    @student.destroy
    redirect_to students_path    
  end
  
  def import
    authorize! :create, @student
    Student.import(params[:file])
    redirect_to students_url, notice: "Students imported."
  end
  
  def male
    authorize! :update, @student
    @student.update_attributes(sex: 'мужской')
    redirect_to :back
  end
  
  def female
    authorize! :update, @student
    @student.update_attributes(sex: 'женский')
    redirect_to :back
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