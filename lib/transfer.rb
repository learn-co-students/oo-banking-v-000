require 'pry'
class Transfer
  require 'pry'
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount=50)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  end 

  def both_valid?
  	if @sender.valid? == true && @receiver.valid? == true
  		true
  	else
  		false
  	end
  end

  def execute_transaction
  	if sender.valid? == true && self.status == "pending"
  		sender.balance -= amount
  		receiver.balance += amount
  		self.status = "complete"
  	else 
  		reject_transfer
  	end
  end

  def reject_transfer
  		@status = "rejected"
  		"Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
  	if @status == "complete"
  		@sender.balance += @amount
 		@receiver.balance -= @amount
  		@status = "reversed"
  	end
  end

end

