class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @status == "pending"
      @sender.balance = @sender.balance - @amount
      if @sender.valid? == false
        @sender.balance = @sender.balance + @amount
        @status = 'rejected'
        return "Transaction rejected. Please check your account balance."
      else
        @receiver.deposit(@amount)
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount*-1)
      @status = "reversed"
    end
  end

end
