class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
       if sender.valid? && status == "pending" && sender.balance >= amount
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
      elsif (!sender.valid? || sender.balance <= amount) && status == "pending"
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
