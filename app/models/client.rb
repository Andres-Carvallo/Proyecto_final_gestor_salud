class Client < ApplicationRecord
    belongs_to :admin
    belongs_to :collaborator
    has_many :services
end
