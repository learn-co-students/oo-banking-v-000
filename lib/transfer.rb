class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return true if @sender.valid? && @receiver.valid? && @sender.balance >= @amount
    return false
  end

  def execute_transaction
    if self.valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end


  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end


end
