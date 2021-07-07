class Transfer
  attr_accessor :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def amount
    @amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    @last_sender = @sender.balance
    @last_receiver = @receiver.balance
    if @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end
  if valid? == false
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
    @sender.balance = @last_sender
    @receiver.balance = @last_receiver
      @status = "reversed"
    end
    
  end


end
