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
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance < amount
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    elsif !self.valid?
      @status = 'rejected'
    elsif @status == 'pending'
        sender.balance = sender.balance - amount
        receiver.balance = receiver.balance + amount
        @status = 'complete'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      @status = 'reversed'
    end
  end

end
