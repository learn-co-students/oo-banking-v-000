require 'pry'

class Transfer
		attr_accessor :sender, :receiver, :status, :amount

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@status = "pending"
		@amount = amount
	end

	def valid?
    	sender.valid? && receiver.valid? && sender.balance > amount
  	end

  	def execute_transaction
  	  if self.valid? && status == "pending"
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
      	 sender.deposit(amount)
      	 receiver.withdraw(amount)
      	 self.status = "reversed"
      end
  	end
  # your code here
end