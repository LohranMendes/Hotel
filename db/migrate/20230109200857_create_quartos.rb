class CreateQuartos < ActiveRecord::Migration[7.0]
  def change
    create_table :quartos do |t|
      t.integer :num

      t.timestamps
    end
  end
end
