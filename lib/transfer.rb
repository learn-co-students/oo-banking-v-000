class Transfer
  attr_accessor :sender, :receiver, :status, :amount
      # initialize a Transfer
      # initializes with a sender
      # initializes with a receiver
      # always initializes with a status of 'pending'
      # initializes with a transfer amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    # can check that both accounts are valid
    #   calls on the sender and reciever's #valid? methods
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.valid? && self.status != "complete" &&
      @sender.balance > @amount
      #expect(amanda.balance).to eq(950)
      @sender.balance -= @amount
      #expect(avi.balance).to eq(1050)
      @receiver.balance += @amount
      self.status = "complete"
    else
      self.reject_transfer
    end
  end
#"rejects a transfer if the sender doesn't have a valid account"
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.valid? && self.status == "complete" &&
      @sender.balance > @amount
      #expect(amanda.balance).to eq(950)
      @sender.balance += @amount
      #expect(avi.balance).to eq(1050)
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end
end
