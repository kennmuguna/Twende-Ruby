class Driver < ActiveRecord::Base
  has_many(:passengers)
end
