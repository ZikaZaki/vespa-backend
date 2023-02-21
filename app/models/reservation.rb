class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle
  belongs_to :city
end
