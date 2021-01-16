class Collaborator < ApplicationRecord
    belongs_to :admin
    has_many :services, dependent: :destroy
    has_many :clients, dependent: :destroy
end
