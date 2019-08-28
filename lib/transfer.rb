class Transfer
attr_reader :sender, :receiver, :amount
attr_accessor :status
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = status
  end
  
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end
  
  def execute_transaction
    if self.status == "pending"
      if sender.valid? == true && receiver.valid? == true 
        if sender.balance >= amount
         sender.balance = sender.balance-amount
          receiver.balance = receiver.balance+amount
          self.status = "complete"
        else
          self.status = "rejected"  
          "Transaction rejected. Please check your account balance."
        end
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
