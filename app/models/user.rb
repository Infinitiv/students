class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable
  belongs_to :role
  has_and_belongs_to_many :students
  before_save :assign_role
  
  def admin?
    self.role.name == 'admin' if self.role
  end
  
  def supervisor?
    self.role.name == 'supervisor' if self.role
  end
  
  def dean?
    self.role.name == 'dean' if self.role
  end
  
  def viewer?
    self.role.name == 'viewer' if self.role
  end
  
  def assign_role
    Role.find_by_name('viewer').users << self if self.role.nil?
  end
end
