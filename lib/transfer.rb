require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end  

  def valid?
    sender.valid? && receiver.valid? && sender.balance > self.amount == true 
  end  


  def execute_transaction
    if valid? && self.status == "pending"
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
      rev_sen = sender.balance += amount
      rev_rec = receiver.balance -= amount
      self.status = "reversed"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
  end  
end

end  









# def reverse_transfer
  #   if valid? && receiver.balance > sender.balance
  #   sender.balance += amount &&
  #   receiver.balance -= amount &&
  #   self.status = "reversed"
  #   binding.pry
  # else
  #   self.status = "rejected"
  #   "Transaction rejected. Please check your account balance."
  #   end
  # end    

