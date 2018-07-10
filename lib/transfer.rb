class Transfer
  
  attr_accessor :status
  
  def initialize
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid  && receiver.valid == true
    end
  end
  
  def execute_transaction
    if sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected.  Please check your account balance."
    elsif
      @status = "complete"
      puts "Transaction was already completed."
    else
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end
  
  def reverse_transfer
  end
  
end
