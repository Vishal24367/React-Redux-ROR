class User < ApplicationRecord
    validates_presence_of :firstName, :lastName, :email, :phoneNumber
    validates_uniqueness_of :email, :phoneNumber
end
