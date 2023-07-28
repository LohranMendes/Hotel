class Quarto < ApplicationRecord
    validates_presence_of :num, message: "deve ser preenchido."
    validates_uniqueness_of :num, message: "já cadastrado."
end
