class Transfer
  attr_accessor :status 
  attr_reader  :sender, :receiver, :amount
  
   def initialize(sender, receiver, amount)
     @sender = sender
     @receiver = receiver
     @status = 'pending'
     @amount = amount
  end
  
   def valid?
     if receiver.valid? && sender.valid? then true
    end
  end

  def reject_transfer
    @status = "rejected"
  "Transaction rejected. Please check your account balance."
    end
  
  def execute_transaction
     if valid? && sender.balance > amount && status =="pending"
      sender.balance -= amount
      receiver.balance += amount
      @status ="complete"
    else
      reject_transfer
  end
  end

  
  def reverse_transfer
     if valid? && receiver.balance > amount && @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    else
      reject_transfer
    end
  end

end

