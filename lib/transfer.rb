class Transfer
    attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount)
        @status = "pending"
        @amount = amount
        @sender = sender
        @receiver = receiver
    end

    def both_valid?
        return true if @sender.valid? == true && @receiver.valid? == true
    else
        false
    end

    def execute_transaction
        if both_valid? && @status == "pending" && @sender.balance > amount
            self.receiver.balance += self.amount
            self.sender.balance -= self.amount
            self.status = "complete"
        else
            reject_transfer
        end
    end

    def reject_transfer
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end

    def reverse_transfer
        if self.status == "complete"
            self.receiver.balance -= self.amount
            self.sender.balance += self.amount
            self.status = "reversed"
        end
    end

  # code here
end
