class CreateTwendeSecond < ActiveRecord::Migration[5.0]
  def change
    create_table(:passengers)  do |p|
      p.column(:name, :string)
      p.column(:email, :string)
      p.column(:password, :string)
      p.column(:phone_number, :int)
      p.column(:driver_id, :int)
    end
  end
end
