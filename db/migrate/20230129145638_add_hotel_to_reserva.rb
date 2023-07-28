class AddHotelToReserva < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservas, :hotel, foreign_key: true
  end
end
