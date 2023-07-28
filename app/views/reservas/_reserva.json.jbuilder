json.extract! reserva, :id, :inicio, :fim, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
