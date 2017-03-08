require("spec_helper")

describe(Driver) do
  describe(Driver)  do
    it("validates presence of fields")  do
      driver = Driver.new({:name => "", :email  => "", :phone_number => "", :car => "", :number_plate => "", :space => "", :route_from => "", :route_to => "", :time => ""})
      expect(driver.save()).to(eq(false))
    end
  end
  
  describe("#passengers") do
    it("tells which passengers beleng to a driver") do
      test_driver = Driver.create({:name => "Mike Brian", :email => "mikebrian@gmail.com", :phone_number => 723455678, :car => "Range Rover", :number_plate => "KCY 456", :space => 4, :route_from => "Kiambu", :route_to => "Nairobi", :time => "3-2-2017 8:00"})
      test_passenger = Passenger.create({:name => "Creg Fed", :email => "cregfed@gmail.com", :phone_number => 734567889, :driver_id => test_driver.id})
      test_passenger2 = Passenger.create({:name => "Dgel Dan", :email => "dgeldan@yahoo.com", :phone_number => 798765431, :driver_id => test_driver.id})
      expect(test_driver.passengers()).to(eq([test_passenger,test_passenger2]))
    end
  end
end
