class Transfer
  	attr_reader :amount, :sender, :receiver
  	attr_accessor :status

  	def initialize(sender, receiver, amount)
    	@status = "pending"
    	@sender = sender
    	@receiver = receiver
    	@amount = amount
  	end

	def valid?
		sender.valid? && receiver.valid?
		sender.balance >= @amount
	end

	
 	def execute_transaction
    	if valid? && sender.balance > amount && @status == "pending"
      		sender.balance -= amount
      		receiver.balance += amount
      		@status = "complete"
    	else
      		@status = "rejected"
    		"Transaction rejected. Please check your account balance."
    	end
  	end

  	def reverse_transfer
  		if valid? && receiver.balance > amount && @status == "complete"
  			receiver.balance -= amount
  			sender.balance += amount
  			@status = "reversed"
  		else
  			@status = "rejected"
    		"Transaction rejected. Please check your account balance."
    	end
  	end
end
