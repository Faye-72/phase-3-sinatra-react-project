class User < ActiveRecord::Base
has_one :patient
has_one :doctor

has_many :feedbacks, through: :patient
end