class Transfer

  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= self.amount
  end

  def execute_transaction
    if self.valid? == false
      self.status = "rejected"
      phrase = "Transaction rejected. Please check your account balance."
    elsif status == "pending" && self.valid?
      @sender.balance -= amount
      @receiver.balance += amount
      puts @status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      #puts @sender.balance
      #puts @receiver.balance
      @sender.balance += amount
      @receiver.balance -= amount
      #puts @sender.balance
      #puts @receiver.balance
      puts @status = "reversed"
    end
  end

end
