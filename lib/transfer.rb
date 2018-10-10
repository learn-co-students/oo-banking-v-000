class Transfer
attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount = 50)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 
  
 def valid?
    @sender.valid? && @receiver.valid? 
  end
  
 def execute_transaction
   if self.valid? && self.status == "pending" && self.amount < sender.balance
     sender.deposit(-amount)
     receiver.deposit(amount)
     self.status = "complete"
   else
     self.status = "rejected"
     return "Transaction rejected. Please check your account balance."
   end
 end
  
  def reverse_transfer
      if valid? && self.status == "complete"
        self.sender.balance += self.amount
        self.receiver.balance -= self.amount
        self.status = "reversed"
      end
    end
  
end
