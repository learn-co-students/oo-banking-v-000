class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount
  # attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
     sender.valid? && receiver.valid? && sender.balance > self.amount
   end

   def execute_transaction
     if self.valid? && self.status == "pending"
       sender.balance -= self.amount
       receiver.balance += self.amount
       self.status = "complete"
     else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
   end

   def reverse_transfer
     if self.status == "complete"
       sender.balance += self.amount
       receiver.balance -= self.amount
       self.status = "reversed"
     end
   end
   
end
