class Admin < ApplicationRecord
    has_many :clients, dependent: :destroy
    has_many :collaborators, dependent: :destroy
end
