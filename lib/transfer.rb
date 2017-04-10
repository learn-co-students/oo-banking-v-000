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
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if !valid?
      return "Transaction rejected. Please check your account balance." && @status = "rejected"
    else
      # binding.pry
      sender.balance -= amount
      receiver.balance += sender.deposit(amount)
      @status = "complete"
    end
  end

  # def reverse_transfer
  #     receiver.balance -= amount && sender.balance += amount if execute_transaction
  # end

end
