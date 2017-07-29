class Transfer
  # your code here
  attr_accessor :sender, :status, :receiver, :amount
  def initialize(sender, to, amount)
  	@sender = sender
  	@receiver = to
  	@status = "pending"
  	@amount = amount

  end

  def valid?
  	if receiver.valid? && sender.valid?
  		true
  	else
  		false
  	end
  end

  def execute_transaction
  	if sender.valid? && sender.balance > amount && @status == "pending"
  	sender.balance -= amount
  	receiver.balance += amount
  	@status = "complete"
  else
  	@status = "rejected"
  	"Transaction rejected. Please check your account balance."
  end

  end

  def reverse_transfer
  	if @status == "complete"
  		sender.balance += amount
  		receiver.balance -= amount
  		@status = "reversed"
  	end
  end

end
