class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amt)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amt
  end
  
  def valid?
    @sender.valid? && @receiver.valid? 
  end
  
  def execute_transaction
    if @status.upcase != "PENDING"
      return nil
    end
    
    str = "Transaction rejected. Please check your account balance."
    
    if !(self.valid?)
      return str
    end
    
    #make sure that the sender has enough $$$ in their acct.
    e_balance = sender.balance - @amount
    
    if e_balance < 0
      @status = "rejected"
      return str
    end
    
    sender.balance -= @amount
    receiver.balance += @amount
    
    @status = "complete"
    true
  end
  
  def reverse_transfer
    if @status.upcase != "COMPLETE"
      return nil
    end
    
    sender.balance += @amount
    receiver.balance -= @amount
    @status = "reversed"
  end
end
