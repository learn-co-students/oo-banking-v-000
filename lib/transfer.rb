class Transfer
  # your code here

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
  	  @sender = sender
  	  @receiver = receiver
  	  @amount = amount
      @status = "pending"
  end

  def valid?
  	  (@sender.balance >= @amount) && (@sender.valid? && @receiver.valid?) 
  end

  def execute_transaction
    
  	if (self.valid?) && (@status == "pending") && (@sender.balance >= @amount)
  	  @sender.balance -= @amount
  	  @receiver.balance += @amount
  	  @status = "complete"
  	else
  	  self.reject_transaction
    end

  end

  def reverse_transfer
  	if (self.valid?) && (@status == "complete") && (@receiver.balance >= @amount)
  	  @sender.balance += @amount
  	  @receiver.balance -= @amount
  	  @status = "reversed"
  	else
  		self.reject_transaction
  	end  
  end

  def reject_transaction
  	  @status = "rejected"	
  	  "Transaction rejected. Please check your account balance."
  end

end
