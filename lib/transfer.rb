class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
  	@status = "pending"
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  end

  def valid?
  	@sender.valid?(@amount) && @receiver.valid?
  end

  def execute_transaction
  	if @status == "complete"
  		"Transaction already completed"
  	elsif !self.valid?
  		@status= "rejected"
  		"Transaction rejected. Please check your account balance."
  	else
  		@sender.balance -= @amount
  		@receiver.deposit(@amount)
  		@status = "complete"
  	end
  end

  def reverse_transfer
  	if @status == "complete"
  		@receiver.balance -=@amount
  		@sender.deposit(@amount)
  		@status = "reversed"
  	end
  end

end
