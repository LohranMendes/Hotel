class CreateHoteis < ActiveRecord::Migration[7.0]
  def change
    create_table :hoteis do |t|
      t.string :nome
      t.string :endereco

      t.timestamps
    end
  end
end
