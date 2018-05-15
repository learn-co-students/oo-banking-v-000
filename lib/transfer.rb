class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
    
  def valid?
    sender.valid? && receiver.valid?
  end
    
  def execute_transaction
    if @amount > sender.balance
      @status = 'rejected'
      return"Transaction rejected. Please check your account balance."
    else if @status != 'complete'
      sender.balance -= self.amount
      receiver.balance += self.amount
      @status = 'complete'
    end
    end
  end
  
  def reverse_transfer
    if self.status == 'complete'
      sender.balance += self.amount
      receiver.balance -= self.amount
      @status = 'reversed'
    end
  end
  
end
