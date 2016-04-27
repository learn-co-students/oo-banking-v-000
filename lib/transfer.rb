class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    true if @sender.valid? && @receiver.valid?
  end

  def execute_transfer
    if status != "complete" && @sender.balance >= amount
      sender.deposit(-amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance"
    end
    
  end


end