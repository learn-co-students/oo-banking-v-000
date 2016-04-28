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

=begin
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
=end

  def execute_transaction
    if both_valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end



end
