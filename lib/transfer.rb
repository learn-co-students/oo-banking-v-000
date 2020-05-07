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
    if @sender.valid?
      if @receiver.valid?
        true
      end
    else
      false
    end
  end

  def execute_transaction
    if @sender.valid? && @sender.balance > @amount
      if self.status == "pending"
        @sender.balance -= self.amount
        @receiver.balance += self.amount
        self.status = "complete"
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    #binding.pry
    if self.status == "complete"
      @sender.balance += self.amount
      @receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
