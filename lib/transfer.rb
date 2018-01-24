require 'pry'
class Transfer
attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    #when we have a question mark, the method will default to true or false
    #below we just have to describe the true condition.
    #later when we invoke this method we can say
    # variable valid? (meaning is the variable valid?)
      sender.valid? && receiver.valid?
  end

  def execute_transaction
    #we use self.status so that we are checking on the particular instance of the transfer
    #and not just on the variable. the variable is initialized and then subsequently
    #manipulated for each instance.
    if valid? && self.status == "pending" && sender.balance >= amount
      #we check if its pending because if it's complete or reversed, then the transfer has already occured
      #this is to prevent transactions from being executed twice.
      receiver.balance += amount
      sender.balance -= amount
      self.status = "complete"
    else
      self.status = "rejected"
     "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end



end
