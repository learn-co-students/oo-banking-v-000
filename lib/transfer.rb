class Transfer
  attr_accessor :status, :sender, :receiver
  attr_reader  :amount

  def initialize(sender, receiver, amount, status = "pending")
  	@sender = sender
  	@receiver = receiver
  	@status = status
  	@amount = amount
  end

  def valid?
  	sender.valid? && receiver.valid?
  end

  def execute_transaction
  	if valid? && sender.balance > amount
  		unless @status == "complete"
	  		receiver.deposit(amount)
	  		sender.withdraw(amount)
	  		@status = "complete"
  	end
  	else 
  		@status = "rejected"
  		"Transaction rejected. Please check your account balance."
  	end
  end

  def reverse_transfer
  	if @status == "complete"
  		receiver.withdraw(amount)
  		sender.deposit(amount)
  		@status = "reversed"
  	end
  end
end
