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
      return false
    end
  end
  
  def execute_transaction
    if valid? == false
      p "Transaction rejected. Please check your account balance."
    elsif @status = "pending" && valid? == true
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
  end
  
  
  
end
