class Transfer
  # your code here
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
  	@status = "pending"
  	@amount = amount
  	@sender = sender
  	@receiver = receiver
  end

  def valid?
  	self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
  	if self.valid? && self.status == "pending" && self.sender.balance >= self.amount
  		self.sender.deposit(-self.amount)
  		self.receiver.deposit(self.amount)
  		@status = "complete"
  	else
  		@status = "rejected"
  		"Transaction rejected. Please check your account balance."
  	end
  end

  def reverse_transfer
  	if self.status == "complete"
  		self.sender.deposit(self.amount)
  		self.receiver.deposit(-self.amount)
  		@status = "reversed"
  	end
  end
end

