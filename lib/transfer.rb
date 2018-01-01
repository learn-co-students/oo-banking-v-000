class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :help
  attr_reader

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@help = @sender.balance
  	@status = "pending"
  end

  def valid?
  	if (@sender.valid? && @receiver.valid?)
  	  true
  	else false
  	end
  end

  def execute_transaction
  	if valid? && status == "pending"
  	  if ((@help -= @amount) > 0)
  	  	@sender.deposit(-@amount)
  	    @receiver.deposit(@amount)
  	    @status = "complete"
  	  else 
  	  	@status = "rejected"
  	  	"Transaction rejected. Please check your account balance."
  	  end
  	else 
  	  @status = "rejected"
  	  "Transaction rejected. Please check your account balance."
  	end
  end

  def reverse_transfer
  	if self.status == "complete"
  	  @sender.deposit(@amount)
  	  @receiver.deposit(-@amount)
  	  @status = "reversed"
  	  "Transaction reversed."
  	end
  end
end 
