class Transfer
  attr_accessor :status, :amount, count
  attr_reader :sender, :receiver
  @count = 0

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
    if count == 0
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    end
    count += 1
  end
end
