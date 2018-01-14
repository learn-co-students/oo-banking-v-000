class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount
  end

  def execute_transaction
    # binding.pry
    if valid? && duplicate? == false
      @@all << self
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def duplicate?
    @@all.include?(self)
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end
end
