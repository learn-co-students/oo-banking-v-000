class Transfer

  attr_accessor :amount, :status
  attr_reader :sender, :receiver



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
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
    end
    @status = "reversed"

  end



end
