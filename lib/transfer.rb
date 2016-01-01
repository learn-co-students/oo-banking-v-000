class Transfer
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if sender.balance < amount
      reject_transfer
    elsif both_valid? && @status == 'pending'
      transaction
    end 
  end

  def reverse_transfer
    reversed if @status == 'complete'
  end

  def reversed
    @status = 'reversed'
    sender.balance += amount
    receiver.balance -= amount
  end

  def transaction
    @status = 'complete'
    sender.balance -= amount
    receiver.balance += amount
  end

  def reject_transfer
    @status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end
end