class Collaborator < ApplicationRecord
    belongs_to :admin
    has_many :services
    has_many :clients
end
