class Transfer
  
  require 'pry'
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    if @status == 'complete'
      !valid?
    elsif amount < sender.balance
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
    elsif amount > sender.balance
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      @status = 'reversed'
    end
  end
  
end
