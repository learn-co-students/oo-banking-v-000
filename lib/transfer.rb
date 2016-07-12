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
		self.sender.valid? &&  self.receiver.valid?
	end
	
	def execute_transaction
		#transfer = Transfer.new(amanda, avi, 50)
		if self.amount > self.sender.balance
			self.status = "rejected"
			"Transaction rejected. Please check your account balance."
		elsif self.status == "pending" && self.valid?
			self.sender.balance = (self.sender.balance - self.amount)
			self.receiver.balance = (self.receiver.balance + self.amount)
			self.status = "complete"
		end		
	end
	
	def reverse_transfer
		if self.status == "complete"
			self.receiver.balance = (self.receiver.balance - self.amount)
			self.sender.balance = (self.sender.balance + self.amount)
			self.status = "reversed"
		end
	end

end
