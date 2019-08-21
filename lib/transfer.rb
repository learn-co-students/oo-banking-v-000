class Transfer
    attr_accessor :sender, :receiver, :amount, :status
    attr_reader :name

    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = 'pending'
    end
    
    def valid?
        if sender.valid? && receiver.valid? && sender.balance > amount
            true
        else
            false
        end
    end
    
    def execute_transaction
        if !valid? || @status == "complete"
            @status = "rejected"
            "Transaction rejected. Please check your account balance."
        else
            sender.balance -= @amount
            receiver.balance += @amount
            @status = "complete"
        end
    end
    
    def reverse_transfer
        if @status == "complete"
            receiver.balance -= @amount
            sender.balance += @amount
            @status = "reversed"
        end
    end
        
    def iHateBanksUseaCreditUnion
    end
end
