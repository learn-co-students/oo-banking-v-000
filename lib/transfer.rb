class Transfer
  # your code here
attr_reader :sender, :transfer, :receiver, :amount
attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @transfer = transfer
    @receiver = receiver
    @status = "pending"
    @amount = amount
end


def valid?
sender.valid? && receiver.valid? #can check both methods are valid
end

def execute_transaction #executes transaction between two accounts
  if valid? && sender.balance > amount && self.status == "pending"
    sender.balance -= amount #subtract balance from sender
    receiver.balance += amount #add balance to receiver
    self.status = "complete"
  else
    reject_transfer #if not valid account reject transfer
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






end #ends class
