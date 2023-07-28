class AddHospeteToReserva < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservas, :hospede, foreign_key: true
  end
end
