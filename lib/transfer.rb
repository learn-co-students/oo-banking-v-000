require 'pry'
class Transfer
#------------------------------------------------------------------
#vars and macros
attr_accessor :sender, :receiver, :amount, :status


#------------------------------------------------------------------
#instance
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

def sufficient_funds?
    if sender.balance >= amount
      true
      else
      false
    end
end

def execute_transaction
    if valid? && sufficient_funds? && @status == "pending"
      sender.withdrawal(@amount)
      receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
end

def reverse_transfer
if valid? && sufficient_funds? && @status == "complete"
      receiver.withdrawal(@amount)
      sender.deposit(@amount)
      
      @status = "reversed"
    end
  end

#------------------------------------------------------------------
#class


end
