require("spec_helper")

describe(Passenger) do
  it("validates presence of fields")  do
    passenger = Passenger.new({:name => "", :email  => "", :password  => "", :phone_number => ""})
    expect(passenger.save()).to(eq(false))
  end
end
