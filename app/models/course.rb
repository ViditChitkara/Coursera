class Course < ActiveRecord::Base
  has_many :certificates
  has_many :students , through: :certificates
  belongs_to :teacher
  has_many :lectures
end
