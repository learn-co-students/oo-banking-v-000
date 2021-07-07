class Transfer
  
    attr_accessor :sender, :receiver, :status, :amount
    
    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @status = "pending"
        @amount = amount
    end
    
    def valid?
        @sender.valid? == true && @receiver.valid? == true && @sender.balance > self.amount
    end
    
    def execute_transaction
        if self.status == "pending" && self.valid? == true
            @sender.balance -= self.amount
            @receiver.balance += self.amount
            @status = "complete"
        else
            @status = "rejected"
            "Transaction rejected. Please check your account balance."
        end     
    end
    
    def reverse_transfer
        if self.status == "complete"
            @sender.balance += self.amount
            @receiver.balance -= self.amount
            self.status = "reversed"
        end
    end
    
end
