require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  # this is a nice elegant method to include:
  # def reject_transfer
  #   self.status = "rejected"
  #   "Transaction rejected. Please check your account balance."
  # end

  def execute_transaction
    if self.valid? && @status == "pending" && @sender.balance > @amount
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      # reject_transfer
    end
  end

  def reverse_transfer
    if self.valid? && @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    # else
    #   reject_transfer
    end
  end

end
