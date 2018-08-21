require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
    
  end
  
  #check that both accounts are valid, + if the sender's balance is greater than transfer amount and account statuses are "pending"
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      #subtract the transfer amount from sender's balance
      sender.balance -= amount
      #add transfer amount to receiver's balamce
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
    # binding.pry
  end

  def reverse_transfer
    #take the money back from receiver and put back in sender's account
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
