class Transfer
    attr_reader :sender, :receiver, :amount
    attr_accessor :status
    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
    end

    def both_valid?
        if @sender.valid? and @receiver.valid?
            return true
        else
            return false
        end
    end

    def execute_transaction
        if (@status == "pending") && (self.both_valid?) && (@amount < @sender.balance)
            @sender.balance -= amount
            @receiver.balance += amount
            @status = "complete"
        else
            @status = "rejected"
            return  "Transaction rejected. Please check your account balance."
        end
    end

    def reverse_transfer
        if (@status == "complete") && (self.both_valid?)
            @sender.balance += amount
            @receiver.balance -= amount
            @status = "reversed"
        end
    end
end
