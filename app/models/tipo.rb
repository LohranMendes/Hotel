class Tipo < ApplicationRecord
    validates_presence_of :quarto, message: "deve ser preenchido."
    validates_uniqueness_of :quarto, message: "já cadastrado."

    has_many :reservas
end
