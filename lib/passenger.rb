class Passenger < ActiveRecord::Base
  belongs_to(:driver)
  validates(:name, :presence =>true)
  validates(:email, :presence =>true)
  validates(:password, :presence => true)
  validates(:phone_number, :presence => true)
end
