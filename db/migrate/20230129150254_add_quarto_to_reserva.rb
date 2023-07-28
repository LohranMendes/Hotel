class AddQuartoToReserva < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservas, :quarto, foreign_key: true
  end
end
