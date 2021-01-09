class Service < ApplicationRecord
    belongs_to :collaborator
    belongs_to :client
end
