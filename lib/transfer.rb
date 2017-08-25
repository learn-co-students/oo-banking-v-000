class Transfer

  	attr_reader :sender, :receiver, :amount
  	attr_accessor :status

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end

	def valid?
		return true if self.sender.valid? == true && balance_valid? && self.receiver.valid? == true && self.status == "pending"
		return false
	end


	def balance_valid?
		new_balance =  self.sender.balance - self.amount
		return true if new_balance > 0
		return false
	end

	def execute_transaction
		if self.valid?
			self.sender.balance -= self.amount
			self.receiver.balance += self.amount
			self.status = "complete"
		else
			self.status = "rejected"
			"Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if self.status == "complete"
			self.sender.balance += self.amount
			self.receiver.balance -= self.amount
			self.status = "reversed"
		end
	end

end
