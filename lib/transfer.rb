require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

    def initialize(sender, receiver, amount)
       @sender = sender
       @receiver = receiver
       @status = "pending"
       @amount = amount
    end

    def valid?
       sender.valid? && receiver.valid?
    end

    def execute_transaction
        if sender.valid? && sender.balance > amount && self.status != "complete"
            receiver.deposit(amount)
            sender.balance -= amount
            self.status = "complete"
        else
            self.status = "rejected"
            "Transaction rejected. Please check your account balance."
        end
    end

    def reverse_transfer
        if self.status == "complete"
            sender.deposit(amount)
            receiver.balance -= amount
            self.status = "reversed"
        end
    end
end
