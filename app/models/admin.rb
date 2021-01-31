class Admin < ApplicationRecord
    has_many :collaborators, dependent: :destroy
end
