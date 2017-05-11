require 'pry'
class Transfer
	attr_accessor :sender, :receiver, :amount, :status

	def initialize(sender, receiver, amount)
		@amount = amount
		@status = "pending"
		@sender = sender
		@receiver = receiver
	end

	def valid?
		@sender.valid? && @receiver.valid?
	end

	def execute_transaction
		if !@sender.valid? || (@status == "pending" && @sender.balance < @amount)
			@status = "rejected"
			"Transaction rejected. Please check your account balance."
		elsif @sender.valid? && @status == "pending"
			@sender.withdrawal(@amount)
			@receiver.deposit(@amount)
			@status = "complete"
		end
	end

	def reverse_transfer
		if @status == "complete"
			@receiver.withdrawal(@amount)
			@sender.deposit(@amount)
			@status = "reversed"
		end
	end
end
