require 'pry'

class Transfer

	attr_accessor :sender, :receiver, :amount, :status

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end

	def both_valid?
		if sender.valid? && receiver.valid? == true
			true
		else
			status = "rejected"
		end
	end

	def execute_transaction
		if status != "complete" && sender.balance > amount
			sender.balance = sender.balance - amount
			receiver.deposit(amount)
			@status = "complete"
		else 
			reject_transfer
		end
	end

	def reject_transfer
		@status = "rejected"
		return "Transaction rejected. Please check your account balance."
	end

	def reverse_transfer
		if status == "complete"
			sender.deposit(amount)
			receiver.balance = receiver.balance - amount
			@status = "reversed"
		end
	end
end