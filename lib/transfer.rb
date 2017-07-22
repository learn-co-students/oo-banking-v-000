class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount
  end

  def execute_transaction
    if (@status == 'pending') && valid?
      @sender.deposit(-amount)
      @receiver.deposit(amount)
      @status = 'complete'
    elsif !valid?
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(amount)
      @receiver.deposit(-amount)
      @status = 'reversed'
    end
  end
end
