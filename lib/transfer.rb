class Transfer
  attr_accessor :sender, :receiver, :amount
  attr_reader :status

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  # def transfer
  # end

  def execute_transaction
   if valid? && sender.balance > amount && self.status == "pending"
     sender.balance -= amount
     receiver.balance += amount
     @status = "complete"
   else
     sender.balance <= 0
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount 
      receiver.balance -= amount
      @status = "reversed"
    end

  end

end
