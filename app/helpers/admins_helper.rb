module AdminsHelper

    def collaborator_total(collaborators)
        total_amount = 0
        collaborators.each do |collaborator|
            collaborator.services.each do |service|
                service.amount += total_amount
            end
        end
        return total_amount
    end
end
