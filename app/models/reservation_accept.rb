class ReservationAccept < ApplicationRecord
    belongs_to :Reservation
    belongs_to :User
end
