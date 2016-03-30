require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :transferred

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  	@transferred = 0
  end

  def both_valid?
  	sender.valid? && receiver.valid?
  end

  def execute_transaction
  	
  	if reject_transfer
  		"Transaction rejected. Please check your account balance."
  	else
	  	sender.balance -= self.amount
	  	receiver.balance += self.amount
	  	self.transferred = self.amount
	  	self.amount = 0
	  	self.status = "complete"
		end
	  	

  end

  def reject_transfer
  	
  	if sender.balance < self.amount || !(sender.valid?)
  		self.status = "rejected" 
  	end
  end

  def reverse_transfer
  	sender.balance += self.transferred
  	receiver.balance -= self.transferred
  	self.status = "reversed"
  end

end

