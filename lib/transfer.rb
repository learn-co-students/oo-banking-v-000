class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :reversal
  
  def initialize(sender, receiver, amount)
    @sender =   sender
    @receiver = receiver
    @amount =   amount
    @status =   'pending'
    @reversal = 0
  end
  
  def both_valid?
    sender.valid? && receiver.valid? ? true : false
  end
  
  def execute_transaction
    if reject_transfer
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    else
      sender.withdrawal(amount)
      receiver.deposit(amount)
      self.amount, self.reversal = self.reversal, self.amount
      self.status = 'complete'
    end
  end
  
  def reverse_transfer
    sender.deposit(reversal)
    receiver.withdrawal(reversal)
    self.status = 'reversed'
  end
  
  def reject_transfer
    self.both_valid? && self.rich_enough? ? false : true
  end
  
  def rich_enough?
    self.sender.balance >= amount
  end
end