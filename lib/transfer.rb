class Transfer
	attr_accessor :sender, :receiver, :status
	attr_reader :amount

	def initialize(sender, receiver, amount)
		@sender, @receiver, @amount = sender, receiver, amount
		@status = "pending"
	end

	def valid?
		sender.valid? && receiver.valid? && amount < sender.balance
	end

	def execute_transaction
		if  self.valid? && status == "pending"
			sender.withdraw(amount)
			receiver.deposit(amount)
			self.status = "complete"
		else
			self.status = "rejected"
			"Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if status == "complete"
			self.receiver, self.sender = sender, receiver
			self.status = "pending"
			execute_transaction
		end
		self.status = "reversed"
	end
end