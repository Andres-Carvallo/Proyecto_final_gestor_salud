class Client < ApplicationRecord
    belongs_to :collaborator
    has_many :services, dependent: :destroy
    validates :name, presence: true
    validates :rut, presence: true
end
