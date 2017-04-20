#####initialize
#can initialize a Transfer
#initializes with a sender
#initializes with a receiver
#always initializes with a status of 'pending'
#initializes with a transfer amount
#####valid?
#can check that both accounts are valid
#calls on the sender and reciever's #valid? methods
#####execute_transaction
#can execute a successful transaction between two accounts
#rejects a transfer if the sender doesn't have a valid account
#####reverse_transfer
#can reverse a transfer between two accounts
#it can only reverse executed transfers

class Transfer
  attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def reject_transfer
    self.status = "rejected"
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
      "Transaction rejected. Please check your account balance."
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
