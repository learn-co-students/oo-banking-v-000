class Transfer

  attr_accessor :sender, :receiver, :amount, :status
 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && sender.balance > amount && status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end

    def reverse_transfer
      if execute_transaction
        sender.balance += amount
        receiver.balance -= amount
        @status = "reversed"
      end
    end




  
end