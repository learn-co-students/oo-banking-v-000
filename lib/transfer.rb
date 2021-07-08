require 'pry'

class Transfer
    attr_accessor :sender, :receiver, :amount, :status, :balance
    
    
    def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = "pending"
    end 
    
    def valid?
        if sender.valid? && receiver.valid?
            true
        else 
            false
        end
    end 
        
        #why does this not create a loop?
        #how does it know to use the valid? method from the Bank_account class and 
        # not just try to execute the transfer.valid?

     
    def execute_transaction
        unless self.status == "complete"
            if (sender.balance - self.amount) > 0
                if self.valid? 
                    #binding.pry
                    self.status = "complete"
                    receiver.balance += self.amount
                    sender.balance -= self.amount
                else  
                    self.status = "rejected"
                    "Transaction rejected. Please check your account balance."
                end 
            else  
                self.status = "rejected"
                "Transaction rejected. Please check your account balance."
            end 
        end    
    end
    
    def reverse_transfer
        if self.status == "complete"
            receiver.balance -= self.amount
            sender.balance += self.amount
            @status = "reversed"
        end    
    end    
end
