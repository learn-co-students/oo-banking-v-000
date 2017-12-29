class Transfer

	attr_accessor :status
	attr_reader :sender, :receiver, :amount

	def initialize(sender, receiver, amount, status = "pending")
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = status
	end

	def valid?
		sender.valid? && receiver.valid?
	end

	def execute_transaction
		if !sender.valid? || sender.balance < amount
			self.status = "rejected"
			"Transaction rejected. Please check your account balance."
		elsif self.status == "pending"
			sender.balance -= amount
			receiver.balance += amount
			self.status = "complete"
		end
	end

	def reverse_transfer
		if self.status == "complete"
			sender.balance += amount
			receiver.balance -= amount
			self.status = "reversed"
		end
	end

end
