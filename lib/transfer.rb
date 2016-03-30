class Transfer
	
	attr_accessor :sender, :receiver, :status, :amount
	@@completed_transactions = []

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end

	def both_valid?
		sender.valid? && receiver.valid?
	end

	def execute_transaction
		unless @@completed_transactions.include?(self) && self.both_valid?
			sender.balance -= @amount
			receiver.balance += @amount
			@status = "complete"
		end
			@@completed_transactions << self
		unless self.both_valid?
			self.reject_transaction
		end
	end

	def reject_transaction
		unless self.both_valid?
			self.status = "rejected"
			"Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if @status == "complete"
			sender.balance += @amount
			receiver.balance -= @amount
			@status = "reversed"
		end
	end

end
