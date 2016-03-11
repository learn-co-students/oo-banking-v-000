class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  @@transfers = []

  def initialize(sender, receiver, amt)
    @@transfers << self
    @sender = sender
    @receiver = receiver
    @amount = amt
    @status = "pending"
  end

  def both_valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    transfer_valid? ? make_transfer : reject_transfer
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    transfer = @@transfers.last
    if transfer.status == "complete" && transfer.both_valid? && transfer.receiver.balance > transfer.amount
      transfer.receiver.balance -= transfer.amount
      transfer.sender.balance += transfer.amount
      transfer.status = 'reversed'
    end
  end

  def transfer_valid?
    @status == "pending" && both_valid? && @sender.balance >= @amount
  end

  def make_transfer
    @sender.withdrawal(@amount)
    @receiver.deposit(@amount)
    @status = "complete"
  end
end