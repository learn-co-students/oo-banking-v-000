class Transfer
  # your code here
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
    if valid? && self.status == "pending" && sender.balance > amount
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else
      reject_transaction
    end
  end

  def reject_transaction
    self.status = "rejected"
     "Transaction rejected. Please check your account balance."
    end

    def reverse_transfer
      if valid? && self.status == "complete" && receiver.balance > amount
        receiver.balance = receiver.balance - amount
        sender.balance = sender.balance + amount
        self.status= "reversed"
      else
        reject_transaction
      end
    end

end
