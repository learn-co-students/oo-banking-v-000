class Transfer
  # your code here
  
  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
      change_status("pending")
      @sender = sender
      @receiver = receiver
      @amount = amount
  end
  
  def valid?
      true if sender.valid? && sender.balance >= @amount && receiver.valid?
  end
  
  def execute_transaction
     valid? && status == "pending" ? complete_transfer(sender, receiver) : reject_transfer
  end
  
  def complete_transfer(s, r)
     s.balance -= @amount
     r.balance += @amount
     change_status("complete")
  end
  
  def reject_transfer
      change_status("rejected")
     "Transaction rejected. Please check your account balance."
  end
  
  def reverse_transfer
      if @status == "complete"
          complete_transfer(receiver, sender)
          change_status("reversed")
      end
  end
  
  def change_status(change)
      @status = change
  end
  
end
