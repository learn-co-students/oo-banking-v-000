class Transfer
	attr_accessor :status, :amount
	attr_reader :sender, :receiver 
  
  def initialize(sender, receiver, amount)
  	@status = "pending"
  	@amount = amount
  	@sender = sender
  	@receiver = receiver
  end

  def both_valid?
  	if sender.valid? && receiver.valid? 
  		true
  	else
  		false
  	end
  end

  def execute_transaction
  	if both_valid? == true && sender.balance > amount && self.status == "pending"
  		sender.balance -= amount
  		receiver.balance += amount
  		self.status = "complete"
  	else
  		reject_transfer
  	end
  end

  def reject_transfer
  	self.status = "rejected"
  	"Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
  	if self.status == "complete"
  		sender.balance += amount
  		receiver.balance -= amount
  		self.status = "reversed"
  	else
  		reject_transfer
  	end
  end



end