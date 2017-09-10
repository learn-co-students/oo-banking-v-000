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
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    unless self.status == "complete"
      if sender.balance >= amount
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      else
        self.status = "rejected"
       "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    end
  end

end
