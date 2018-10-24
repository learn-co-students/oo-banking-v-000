class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender_and_receiver_valid? && sender_has_enough_funds?
  end

  def execute_transaction  
    if !valid?
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end

    if @status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end

  private

  def sender_has_enough_funds?
    sender.balance >= amount
  end

  def sender_and_receiver_valid?
    sender.valid? && receiver.valid?
  end
end
