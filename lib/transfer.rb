require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      negative_amount = -(@amount)
      positive = @sender.deposit(negative_amount)
      if positive >= 0
        @receiver.deposit(@amount)
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction #{self.status}. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      negative_amount = -(@amount)
      @receiver.deposit(negative_amount)
      @sender.deposit(@amount)
      self.status = "reversed"
    end
  end

end
