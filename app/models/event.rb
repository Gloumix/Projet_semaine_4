require 'date'

class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances

    belongs_to :user

    validates :start_date,
    presence: true, if: :is_not_past?

    def is_not_past?
        start_date > Time.now
    end

    validates :duration,
    presence: true, if: -> { duration%5 == 0 && duration > 0 }

    validates :price,
    presence: true,
    length: { in: 1..1000 }

    validates :description,
    presence: true,
    length: { in: 20..1000 }

    validates :location,
    presence: true


end
