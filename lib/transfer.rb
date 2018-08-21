class Transfer
  
  attr_accessor :status, :last_transfer
  attr_reader :sender, :receiver, :amount 
  
  def initialize(new_sender, new_receiver, new_amount)
    @sender = new_sender
    @receiver = new_receiver
    @amount = new_amount
    @status = "pending"
  end 
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  
  def execute_transaction
    if valid? && (@sender.balance - @amount) > 0 && @status == "pending"
      @receiver.deposit(@amount)
      @sender.withdraw(@amount)
      @status = "complete"
      @last_transfer = @amount
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    if @status == "complete"
      @receiver.withdraw(@last_transfer)
      @sender.deposit(@last_transfer)
      @status = "reversed"
    end 
  end 
    
  
    
  
end
