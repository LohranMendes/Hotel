class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.date :inicio
      t.date :fim

      t.timestamps
    end
  end
end
