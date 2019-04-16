class Transfer

  attr_accessor :amount, :sender, :receiver
  attr_reader :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    @sender.balance > @amount && @sender.valid? == true && @receiver.valid? == true && self.status == "pending"
  end

  def execute_transaction

    if self.valid? == true
      @sender.withdraw_or_transfer(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if @status == "complete"
      @receiver.withdraw_or_transfer(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    else nil
    end
  end











end
