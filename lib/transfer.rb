class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  end
  def both_valid?
  	sender = @sender
  	receiver = @receiver
  	sender.valid? && receiver.valid?
  end
  def execute_transaction
  	if @status == "pending" && self.both_valid? && @sender.balance >= @amount
  		@sender.balance -= @amount
  		@receiver.balance += @amount
  		@status = "complete"
  	elsif @status == "pending" && (!@sender.valid? || @sender.balance < @amount)
  		self.reject_transfer
  		#@status = "rejected"
  	end
  end
  def reject_transfer
  	@status = "rejected"
  	return "Transaction rejected. Please check your account balance."
  end
  def reverse_transfer
  	if @status == "complete"
  		@receiver.balance -= @amount
  		@sender.balance += @amount
  		@status = "reversed"
  	end
  end
end