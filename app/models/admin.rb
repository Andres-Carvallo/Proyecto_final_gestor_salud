class Admin < ApplicationRecord
    has_many :clients
    has_many :collaboratos
end
