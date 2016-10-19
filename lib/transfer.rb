class Transfer
	attr_accessor :status
	attr_reader :sender, :receiver, :amount

	def initialize(sender, receiver, amount)
		@status = "pending"
		@sender = sender
		@receiver = receiver
		@amount = amount
	end

	def valid?
		sender.valid? && receiver.valid?
	end

	def execute_transaction
		if valid? && sender.balance > amount && self.status != "complete"
			receiver.deposit(amount)
			sender.withdrawal(amount)
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
		receiver.withdrawal(amount) && sender.deposit(amount) unless self.status != "complete"
		self.status = "reversed"
	end

end
