class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender_account, receiver_account, amount)
    @sender_account = sender_account
    @receiver_account = receiver_account
    @amount    = amount
    @sender    = sender_account
    @receiver  = receiver_account
    @status    = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if sender.balance >= amount
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    end
  end

end
