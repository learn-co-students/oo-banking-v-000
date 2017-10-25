class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    sender.valid? == true && receiver.valid? == true ? true : false
  end

  def execute_transaction
    if self.status != "complete" && sender.valid? == true && receiver.valid? == true
      if sender.balance > amount
        receiver.balance = receiver.balance + amount
        sender.balance = sender.balance - amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if status == 'complete'
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      self.status = "reversed"
    end
  end

end
