require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    # self.sender.status == "open" && self.receiver.status == "open"
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # binding.pry 
    if self.status == "pending" && valid? == true && self.sender.balance > amount 
      self.sender.balance -= amount
      self.receiver.deposit(amount)
      self.status = "complete"
    else #self.status == "pending" && self.sender.valid? == false 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(amount) 
      self.receiver.balance -= amount 
      self.status = "reversed"
    else 
    end 
  end 

end

