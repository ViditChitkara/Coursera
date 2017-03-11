class Student < ActiveRecord::Base
  has_many :certificates
  has_many :courses , through: :certificates
end
