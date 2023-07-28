class Hospede < ApplicationRecord
    #encoding: utf-8
    validates_presence_of :nome, :CPF, :idade, message: "deve ser preenchido."
    validates_uniqueness_of :CPF, message: "já cadastrado."

    has_many :reservas
end
