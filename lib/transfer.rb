require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  #transfer_amount is the same as amount.

  def initialize(sender, receiver, amount)
     @sender =    sender
     @receiver =  receiver
     @status =   'pending'
     @amount =    amount
    #  @transfer =  amount

  end

  def valid?   # refering to both the sender and receiver account.
  #  @sender == sender &&  @receiver == receiver
     sender.valid? && receiver.valid?
  end

  def execute_transaction
      # sender.balance -= amount
      # receiver.balance += amount
      #status is always pending
   if valid? && self.status != "complete" && sender.balance > amount
       sender.balance -= amount
       receiver.balance += amount
       self.status = "complete"
  else
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if valid? && self.status == "complete" && receiver.balance > amount
        receiver.balance -= amount
        sender.balance  += amount
        self.status = "reversed"
   else
     self.status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
  end

end
