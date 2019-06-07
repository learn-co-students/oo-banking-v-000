require 'pry'

require_relative 'bank_account.rb'

class Transfer
  attr_accessor :amount, :sender, :receiver, :status
  attr_reader :name
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @transfer = self
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if amount > sender.balance
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending" && valid?
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      @status = "reversed"
    end
  end
  
end
