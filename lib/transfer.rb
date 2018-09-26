class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return 
    end
  end
  
  def execute_transaction
    if @status = "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
  end
  
  
  
end
