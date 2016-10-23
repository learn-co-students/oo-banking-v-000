class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if valid? == true
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      @reverse = @amount
      @amount = 0
      # binding.pry
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if !@reverse.nil?
      @sender.balance += @reverse
      @receiver.balance -= @reverse
      @status = "reversed"
      @reverse = 0
    end
  end
end
