require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = "pending"
  end

  def valid?
  	sender.status == "open" && sender.balance > 0 && receiver.status == "open"
  	sender.valid? && receiver.valid?
  end

  def execute_transaction
  	if @status != "complete" && self.valid? == true
  		#	binding.pry	
		sender.balance -= @amount  		
		receiver.balance += @amount
		@status = "complete"
	end	
  	
  	if self.valid? != true
  		@status = "rejected"
  		"Transaction rejected. Please check your account balance."  	 
  	end
  end

  def reverse_transfer
  	if @status == "complete"
  		@sender.balance += @amount
  		@receiver.balance -= @amount
  		@status = "reversed"
  	end
  end
end
