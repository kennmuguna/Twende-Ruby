class Passenger < ActiveRecord::Base
  belongs_to(:driver)
end
