class Transfer

  attr_accessor :status, :amount, :transfer_amt
  attr_reader :receiver, :sender

  def initialize(sender, receiver, transfer_amt = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer_amt
  end

  def valid?
    self.sender.valid? && self.receiver.valid?                #transfer is valid if both accounts are valid
  end

  def execute_transaction
    if self.valid? && self.sender.balance >= self.amount && self.status == "pending" #if transfer is valid, sender balance is enough, and transfer hasn't occured yet
      self.sender.balance -= self.amount      #reduce sender balance
      self.receiver.balance += self.amount    #increase receiver balance
      self.status = "complete"                #update transfer status
    else self.sender.valid? == false || self.sender.balance < self.amount  #if sender is not valid or doesn't have enough $, reject with message
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"            #if transfer is completed, flip add/sub amount and change status.
     self.sender.balance += self.amount
     self.receiver.balance -= self.amount
     self.status = "reversed"
    end
  end

end
