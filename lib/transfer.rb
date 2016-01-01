class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bank_account

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

#---- VALIDATION
  def both_valid?
    if sender.valid? && receiver.valid?
      true
    else
      self.reject_transfer
      false
    end
  end

#---- SENDING MONEY 
  def execute_transaction
    unless self.status == "complete"
      if both_valid? && sender.balance > @amount
        sender.balance = sender.balance - @amount
        receiver.balance = receiver.balance + @amount
        self.status = "complete"
      else
        reject_transfer
      end
    end
  end

#---- REJECT TRANSFER
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

#---- REVERSE ACCOUNTS -- it can only reverse with executed transfers
  def reverse_transfer
    if self.status == "complete"
      sender.balance = sender.balance + @amount
      receiver.balance = receiver.balance - @amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

end