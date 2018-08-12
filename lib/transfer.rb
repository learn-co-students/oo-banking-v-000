require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    #binding.pry
    @amount = amount
    @sender = sender
    @receiver = receiver 
    @status = 'pending'
  end 
  
  def valid?
    @sender.valid? && @receiver.valid? 
  end 
  
  def execute_transaction
    if valid? && sender.balance > amount && @status = "pending"
      sender.balance -= amount 
      receiver.balance += amount 
      @status = 'complete'
      #binding.pry
    else 
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
      
    end 
  end 
  
  def reverse_transfer
    #binding.pry
    sender.balance += amount
    receiver.balance -+ amount 
    @status = 'reversed'
  end 
end
