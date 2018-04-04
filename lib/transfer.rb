class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver 
  @status = 'pending'
  @amount = amount
  end
  
  def valid?
    @sender.valid?
    @receiver.valid?
  end
  
  def execute_transaction
    sender_balance = @sender.balance 
    receiver_balance = @receiver.balance 
    sender_change = sender_balance - @amount 
    receiver_change = receiver_balance + @amount
    @sender.balance = sender_change 
    @receiver.balance = receiver_change
    self.status = "complete"
    if @sender.valid? == false 
      "Transaction rejected. Please check your account balance."
    end
  end
  
end
