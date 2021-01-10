class Transfer

  attr_accessor :BankAccount, :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      if @sender.balance > 0 && self.valid?
        @status = "complete"
      elsif
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
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
