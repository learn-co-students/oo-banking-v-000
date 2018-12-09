require 'pry'
class Transfer
attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid? && sender.balance >= self.amount
    # does sender balance(100) have equal to or greater than amount to transfer(30)

    
  end
  
  def execute_transaction
    if !self.valid?
        self.status=("rejected")
        "Transaction rejected. Please check your account balance."
        
    elsif self.status == "pending"
      
      receiver.balance += @amount
      sender.balance -= @amount
      self.status=("complete")
    end
  end

  def reverse_transfer

      
       if self.status == "complete" 
        sender.balance += @amount
        receiver.balance -= @amount
        self.status=("reversed")
        end
      
      # binding.pry
      #binding.pry sender and receiver balances are both 1000, why am i getting the wrong amount???
      
    
    #make sure that both accounts are valid (y)
    #make sure that reversal possible between executed transfers
    #subtract money from receiver's account, add money to sender's account
    
    
  end
  
end
