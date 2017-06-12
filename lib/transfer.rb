require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid? == true
      true
    end
  end

  def execute_transaction
    #binding.pry
    if @status == 'pending' && @sender.valid? && @sender.balance > self.amount
      #binding.pry
      new_balance_receiver = receiver.balance + amount
      new_balance_sender = sender.balance - amount
      receiver.balance = new_balance_receiver
      sender.balance = new_balance_sender
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      sender_reversed_balance = sender.balance + amount
      receiver_reversed_balance = receiver.balance - amount
      sender.balance = sender_reversed_balance
      receiver.balance = receiver_reversed_balance
      @status = 'reversed'
    end 
  end

end
