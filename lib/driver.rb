class Driver < ActiveRecord::Base
  has_many(:passengers)
  validates(:name, :presence =>true)
  validates(:email, :presence =>true)
  validates(:phone_number, :presence => true)
  validates(:car, :presence => true)
  validates(:car, :presence => true)
  validates(:number_plate, :presence => true)
  validates(:space, :presence => true)
  validates(:route_from, :presence => true)
  validates(:route_to, :presence => true)
  validates(:time, :presence => true)
end
