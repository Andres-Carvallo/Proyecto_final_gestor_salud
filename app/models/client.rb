class Client < ApplicationRecord
    belongs_to :collaborator
    has_many :services
    validates :name, presence: true
    validates :rut, presence: true
end
