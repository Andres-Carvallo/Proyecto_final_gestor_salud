class Admin < ApplicationRecord
    has_many :clients
    has_many :collaborators
end
