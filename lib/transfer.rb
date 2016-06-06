class Transfer

  attr_reader :sender, :receiver, :amount 
  attr_accessor :status 

  TRANSFER_AMT  = [] 

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount = sender, receiver, amount
    @status = "pending"
    TRANSFER_AMT << amount 
  end


  def valid?
    return true if sender.valid? && receiver.valid? && 
    sender.balance > amount && status == "pending"
    false 
  end


  def execute_transaction 
    if self.valid? == false 
       self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else 
      receiver.deposit(amount)
      sender.balance -= amount 
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(TRANSFER_AMT.last)
      receiver.display_balance
      receiver.balance -= TRANSFER_AMT.last 
      self.status = "reversed"
    end
  end



end
