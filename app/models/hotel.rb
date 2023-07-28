class Hotel < ApplicationRecord
    paginates_per 3
    validates_presence_of :nome, :endereco, message: "deve ser preenchido."
    validates_uniqueness_of :nome, :endereco, message: "já cadastrado."
    has_many :reservas
end
