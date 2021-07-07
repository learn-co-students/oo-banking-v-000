class Transfer
attr_accessor :status, :balance
attr_reader :sender, :name, :amount, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @name = name
    @amount = amount
    @status = "pending"
    @receiver = receiver
    @balance = balance
    @transactions = []
  end 

  def valid?
    @sender.valid? && @receiver.valid?
  end 

  def execute_transaction
    if @sender.balance >= @amount && @status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end 

  def reverse_transfer
    if @sender.balance >= @amount && @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
