class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid? #both have to be valid data-visibility
    if sender.valid? && receiver.valid?
      true
    else false
    end
  end


#  can execute a successful transaction between two accounts (FAILED - 1)
#       each transfer can only happen once (FAILED - 2)
#       rejects a transfer if the sender doesn't have a valid account (FAILED - 3)
  def execute_transaction


    if self.status != "complete" && self.valid? == true && sender.balance >= amount
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    else self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if @status == "complete"
      receiver.balance = receiver.balance - amount
      sender.balance = sender.balance + amount
      @status = "reversed"
    end
  end

end
