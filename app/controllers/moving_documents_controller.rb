class MovingDocumentsController < ApplicationController
  def create
    students = Student.where(id: params[:student_ids])
  end
end