require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && self.status != "complete"
      transfer = Transfer.new(sender, receiver, amount)
      transfer.receiver.balance += amount
      transfer.sender.balance -= amount
      @status = "complete"
    end
    if @sender.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      #binding.pry
    end
  end

  def reverse_transfer
    if @status == "complete"
      transfer = Transfer.new(sender, receiver, amount)
      transfer.receiver.balance -= amount
      transfer.sender.balance += amount
      @status = "reversed"
    end
  end

end
