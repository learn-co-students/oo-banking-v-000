class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status, :transfers
  
  @@transfers = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? 
    @receiver.valid?
  end
  
  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif !@@transfers.include?(self) && self.valid?
      @sender.deposit(-amount)
      @receiver.deposit(amount)
      @status = "complete"
      @@transfers << self
    end
  end
  
  def reverse_transfer
    if @@transfers.include?(self)
      @sender.deposit(amount)
      @receiver.deposit(-amount)
      @status = "reversed"
    end
  end
  
end
