require 'pry'


class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@transfers = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true && @sender.balance > @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == true && !@@transfers.include?(self)
      @sender.balance -= @amount
      @receiver.balance += @amount
      @@transfers << self
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @@transfers.include?(self)
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
