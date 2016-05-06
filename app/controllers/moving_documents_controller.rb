class MovingDocumentsController < ApplicationController
  before_action :set_movning_document, only: [:show]
  before_action :moving_document_params, only: [:create, :destroy]
  
  def show
    authorize! :read, @moving_document
  end
  
  def create
    authorize! :manage, @moving_document
    moving_document = MovingDocument.new(moving_document_params)
    students = Student.where(id: params[:student_ids])
    status_id = params[:status_id]
    if moving_document.save!
      moving_document.students << students
      students.each do |student|
        Move.create(student_id: student.id, next_status_id: status_id, previous_status_id: student.status_id, moving_document_id: moving_document.id)
        student.update_attributes(status_id: status_id)
      end
      redirect_to moving_document_path(moving_document)
    end
  end
  
  def destroy
    authorize! :manage, @moving_document
  end
  
  private
  
  def set_movning_document
    @moving_document = MovingDocument.find(params[:id])
  end
  
  def moving_document_params
    params.require(:moving_document).permit(:name, :number, :date, :type, :file)
  end
end