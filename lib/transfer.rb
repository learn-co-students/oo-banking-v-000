class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? #? true : false
  end

  def execute_transaction
    if status == "pending" && @sender.balance - @amount > 0
      @sender.balance = @sender.balance -  @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    elsif
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance +  @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end
end
