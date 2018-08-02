require "pry"
class Transfer

  attr_reader :amount, :sender, :receiver
  attr_accessor :status, :bank_account
  
def initialize(sender, receiver, amount, status = "pending")
  @sender = sender
  @receiver = receiver
  @status = status
  @amount = amount
end

  def valid?
     sender.valid? && receiver.valid?
  end

  def execute_transaction
   if valid? && sender.balance > amount && self.status == "pending"
       sender.balance -= amount
       receiver.balance += amount
       self.status = "complete"
     else
       bad_transfer
    end
  end
  
  def bad_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance." 
    end
    
    def reverse_transfer
      # binding.pry
      if execute_transaction && receiver.balance > amount 
       
             sender.balance += amount
             receiver.balance -= amount
             self.status = "reversed"
       else
        bad_transfer
      end
     end
        
end
