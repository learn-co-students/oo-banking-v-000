class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    (((@sender.valid?) && (@receiver.valid?)) && (@sender.balance >= @amount)) ? true : false
  end

  def execute_transaction
    if ((@status == "pending") && (self.valid?))
      @receiver.deposit(amount)
      @sender.deposit(-1 * (amount))
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (@status == "complete")
      @sender.deposit(amount)
      @receiver.deposit(-1 * (amount))
      self.status = "reversed"
    end
  end


end
