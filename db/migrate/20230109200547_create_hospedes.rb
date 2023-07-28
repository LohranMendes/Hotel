class CreateHospedes < ActiveRecord::Migration[7.0]
  def change
    create_table :hospedes do |t|
      t.string :nome
      t.integer :idade
      t.string :CPF

      t.timestamps
    end
  end
end
