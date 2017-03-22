class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount



  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      if sender.valid?
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
    end
    self.status = "reversed"

  end



end
