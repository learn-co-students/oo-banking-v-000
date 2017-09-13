class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    #calls on sender and receiver methods to check whether valid
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? && @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      self.status = "rejected"
      "Transaction #{self.status}. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && @receiver.balance > @amount && @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    else
      self.status = "rejected"
      "Transaction #{self.status}. Please check your account balance."
    end
  end


end
