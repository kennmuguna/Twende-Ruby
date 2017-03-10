class CreateTwende < ActiveRecord::Migration[5.0]
  def change
    create_table(:drivers)  do |d|
      d.column(:name, :string)
      d.column(:email, :string)
      d.column(:password, :string)
      d.column(:phone_number, :int)
      d.column(:car, :string)
      d.column(:image, :string)
      d.column(:number_plate, :string)
      d.column(:space, :int)
      d.column(:route_from, :string)
      d.column(:route_to, :string)
      d.column(:time, :integer)
    end
  end
end
