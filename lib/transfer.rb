class Transfer
  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  end
  def both_valid?
  	@sender.valid? && @receiver.valid?
  end
  def execute_transaction
  	if @status == "pending" && self.both_valid?
  		@sender.balance -= @amount
  		@receiver.balance += @amount
  		@status = "complete"
  	elsif @status == "pending" && !@sender.valid?
  		self.reject_transfer
  		@status = "rejected"
  	end
  end
  def reject_transfer
  	return "Transaction rejected. Please check your account balance."
  end
  def reverse_transfer
  	if @status = "complete"
  		@receiver.balance -= @amount
  		@sender.balance += @amount
  		@status = "reversed"
  	end
  end
end