class Transfer

	attr_accessor :sender, :receiver, :amount, :status

	@@transfers = []

	def initialize(sender, receiver, amount=50)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end

	def valid?
		if self.sender.valid? == true && self.receiver.valid? == true
			true
		else
			false
		end
	end

	def execute_transaction
		if @@transfers.include?(self)
			nil
		elsif self.valid? == false || self.sender.balance <= self.amount
			self.status = "rejected"
			return "Transaction rejected. Please check your account balance."
		else
			sender.balance -= self.amount
			receiver.balance += self.amount
			self.status = "complete"
			@@transfers<<self
		end
	end

	def reverse_transfer
		if @@transfers.include?(self)
			sender.balance += self.amount
			receiver.balance -= self.amount
			self.status = "reversed"
			@@transfers.delete(self)
		else
			nil
		end
	end

end
