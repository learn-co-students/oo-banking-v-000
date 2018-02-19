class Transfer
  attr_accessor :sender, :receiver, :status
  attr_reader :amount
  
  @@execute_transaction = false
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    if valid? && @sender.balance > @amount
      @sender.balance  = @sender.balance - @amount
      @receiver.deposit(amount)
      @status = "complete"
      @@execute_transaction = true
      define_singleton_method(:execute_transaction) {}
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @@execute_transaction == true
      @receiver.balance  = @receiver.balance - @amount
      @sender.deposit(amount)
      @status = "reversed"
      @@execute_transaction = false
    end
  end
end
