class Reserva < ApplicationRecord
    paginates_per 3
    validates_presence_of :inicio, :fim, message: "deve ser preenchido."
    belongs_to :hospede
    belongs_to :tipo
    belongs_to :hotel
    belongs_to :quarto
end
