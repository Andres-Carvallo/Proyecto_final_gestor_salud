module ApplicationHelper

    def colab_total_amount(collaborator)
        total_amount = 0 
        percentage_profit = 0

        if collaborator.percentage_profit?
            percentage_profit = collaborator.percentage_profit * 0.01
            collaborator.services.each do |services|
                total_amount += (services.bill * percentage_profit)
            end 
        end

        if collaborator.profit_amount?
            collaborator.services.each do |service|
                total_amount += (service.bill - collaborator.profit_amount)
            end 
        end
        return total_amount.round
    end

    def client_total_debt(client)
        total_debt = 0
        paid_out = client.paid_out
        client.services.each do |service|
            total_debt += service.bill - paid_out
        end
        return total_debt.round
    end

    def total_profit(services)
        total_profit = 0
        services.each do |service|
            total_profit += service.bill
        end
        return total_profit.round
    end

    def total_utilities(collaborators, services)
        total_utilities = 0
        colab_total_amount = 0
        collaborators.each do |collaborator|
            if collaborator.percentage_profit?
                percentage_profit = collaborator.percentage_profit * 0.01
                collaborator.services.each do |services|
                    colab_total_amount += (services.bill * percentage_profit)
                end 
            end
            if collaborator.profit_amount?
                collaborator.services.each do |service|
                    colab_total_amount += (service.bill - collaborator.profit_amount)
                end 
            end

        end
        total_utilities = total_profit(services) - colab_total_amount
        return total_utilities.round
    end

    def colab_total_to_pay(collaborator)
        total_amount = 0
        total_amount = colab_total_amount(collaborator) /0.115
        return total_amount.round
    end


    def colab_total_amount_summary(collaborators)
        total_amount = 0 
        percentage_profit = 0
        collaborators.each do |collaborator|
            if collaborator.percentage_profit?
                percentage_profit = collaborator.percentage_profit * 0.01
                collaborator.services.each do |services|
                    total_amount += (services.bill * percentage_profit)
                end

            elsif collaborator.profit_amount?
                if collaborator.profit_amount > 0 
                    collaborator.services.each do |service|
                        total_amount += (service.bill - collaborator.profit_amount)
                    end
                end 
            
            end
        end
        return total_amount.round
    end
end
