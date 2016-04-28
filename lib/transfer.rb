require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end


  def both_valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end


  def execute_transaction

    if @status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    elsif @status == "complete"
      return nil
    elsif self.reject_transfer
      puts "Transaction rejected. Please check your account balance."
    end
  end

  def self.reject_transfer
    if !sender.valid?
      return true
    else
      return false
    end
  end



end
