class Move < ActiveRecord::Base
  belongs_to :student
  belongs_to :moving_document
end
