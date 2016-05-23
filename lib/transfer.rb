class Transfer

  attr_reader :sender, :receiver, :amount, :status
  
  @@all = []  

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? == receiver.valid?
  end

  def execute_transaction
    if !@@all.include?(self) && sender.valid?
      sender.balance = sender.balance - amount.to_i
      receiver.deposit(amount)
      @status = "complete"
      @@all << self
    end
    if !sender.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @@all.include?(self)
      receiver.balance = receiver.balance - amount.to_i
      sender.deposit(amount)
      @status = "reversed"
    end
  end

end
