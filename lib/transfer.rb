class Transfer
attr_reader :sender, :receiver, :amount
attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    @original_sender_balance = sender.balance
     if self.valid? && self.status == "pending" && sender.balance > amount
       sender.balance -= amount
       receiver.balance += amount
       self.status = "complete"
     else
       reject_transfer
     end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
     receiver.balance -= amount
     sender.balance += amount
     self.status = "reversed"
   else
     reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
