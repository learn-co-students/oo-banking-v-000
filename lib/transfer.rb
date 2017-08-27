require('pry')
class Transfer
  attr_accessor :status
  attr_reader :receiver, :sender, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @last_transfer = nil
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && status == "pending" && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
      @last_transfer = self
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @last_transfer && @last_transfer.status == "complete"
    @last_transfer.sender.balance += @last_transfer.amount
    @last_transfer.receiver.balance -= @last_transfer.amount
    @last_transfer.status = "reversed"
    end
  end

end
