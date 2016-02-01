require'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amt)
  	@sender = sender
  	@receiver = receiver
  	@amount = amt  	
  	@status = "pending"
  end
  
  def both_valid?
  	sender.valid? && receiver.valid?
  end
  
  def execute_transaction
 		bal = @sender.balance - @amount
 		if bal > 0 && @status != "complete"
 			@sender.withdraw(@amount)
 			@receiver.deposit(@amount)
 			@status = "complete"
 		else
 			@status = "rejected"
 			"Transaction rejected. Please check your account balance."
 		end
 	end
 	
 	def reverse_transfer
 		if @status == "complete"
 			@sender.deposit(@amount)
 			@receiver.withdraw(@amount)
 			@status = "reversed"
 		end
 	end
 		
end