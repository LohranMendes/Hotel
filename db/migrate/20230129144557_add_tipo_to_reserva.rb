class AddTipoToReserva < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservas, :tipo, foreign_key: true
  end
end
