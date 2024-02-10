class Salar < ApplicationRecord
    belongs_to :user
    has_many :buyers
end
