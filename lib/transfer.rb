class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid? # def valid? is using the methods of the BankAccount class
  end
  
  def execute_transaction
    unless status == "complete" # to make sure the transaction    executes only one time
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    
      if sender.valid? == false # or !sender.valid?
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
   end
   
   def reverse_transfer
     if status == "complete" # from the execute_transaction method
       sender.balance += amount
       receiver.balance -= amount
       self.status = "reversed"
     end 
   end
   
end
