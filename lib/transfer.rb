class Transfer
	attr_accessor :status, :amount
	attr_reader :sender, :receiver


	def initialize (sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@status = "pending"
		@amount = amount
	end

	def valid?
		sender.valid? && receiver.valid?
	end
	
  def execute_transaction
    if self.status == "pending"
    
      sender.balance = sender.balance - amount
			receiver.balance = receiver.balance + amount
    
      if self.valid?
        self.status = "complete"
		  else
			  self.status = "rejected"
			  return "Transaction rejected. Please check your account balance."
		  end
    end		
		
	end


end