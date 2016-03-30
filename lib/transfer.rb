class Transfer
	attr_accessor :sender
	attr_accessor :receiver
	attr_accessor :status
	attr_accessor :amount

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@status = "pending"
		@amount = amount
	end

	def both_valid? 
		sender.valid? && receiver.valid?
	end

	def execute_transaction
		if @status != "complete"
			if !reject_transfer
				@sender.balance -= @amount
				@receiver.balance += @amount
				@status = "complete"
			else
				@status = "rejected"
				"Transaction rejected. Please check your account balance."
			end
		end
	end

	def reject_transfer
		!(@sender.valid? && @sender.balance >= @amount)
	end

	def reverse_transfer
		if @status == "complete"
			@receiver.balance -= @amount
			@sender.balance += @amount
			@status = "reversed"
		end
	end
end
