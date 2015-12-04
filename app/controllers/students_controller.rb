class StudentsController < ApplicationController
  before_action :set_student, only: [:show]
  def index
    @students = Student.all
  end
  
  def show
    
  end
  
  def import
    Student.import(params[:file])
    redirect_to students_url, notice: "Students imported."
  end
  
  private
  
  def set_student
    @student = Student.includes(:educational_program).find(params[:id])  
  end
end