class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if ((self.sender.valid?)&&(self.sender.balance >= self.amount)&&(self.receiver.valid?))
      true
    else
      false
    end
  end

  def execute_transaction
    if (self.status == 'pending') && (self.valid?)
      sender.deposit((-1)*amount)
      receiver.deposit(amount)
      self.status="complete"
    else
      self.status='rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      reverse = Transfer.new(self.receiver, self.sender, self.amount)
      reverse.execute_transaction
      self.status='reversed'
    else
      "Not gonna do it"
    end
  end

end
