class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && @status == 'pending' && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
    elsif sender.balance < amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      @status = 'reversed'
    end
  end


end