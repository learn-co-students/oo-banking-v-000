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
    if @sender.valid? && @receiver.valid? && @amount < @sender.balance
      true
    else
      false
    end
  end

  def execute_transaction
    x = -(@amount)
    if @status == "pending" && self.valid? == true
      @receiver.deposit(@amount)
      @sender.deposit(x)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end



  def reverse_transfer
    x = -(@amount)
    if @status == "complete"
      @receiver.deposit(x)
      @sender.deposit(@amount)
      @status = "reversed"
    end



  end






end
