class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid?
      if self.status == "pending"
        if @sender.balance >= @amount
          @sender.deposit(-@amount)
          @receiver.deposit(@amount)
          @status = "complete"
        else
          reject("Transaction rejected. Please check your account balance.")
        end
      end
    else
        reject("Error, invalid account(s)!")
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @amount = -@amount
      self.status = "pending"
      self.execute_transaction
      self.status = "reversed"
    else
      reject("Transaction Reversal Failure")
    end
  end

  def reject(message)
    @status = "rejected"
    message
  end

end
