class Transfer
 	attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender, receiver, amount)
  	@amount = amount
  	@status = "pending"
  	@sender = sender 
  	@receiver = receiver
  end

  def both_valid?
  	self.sender.valid?
  	self.receiver.valid?
  end

  def execute_transaction 
  	if  self.status == "pending" && self.sender.valid? == true && sender.balance >= amount
  			self.sender.balance -= amount
  			self.receiver.balance += amount
  			self.status = "complete" 
  		else
  			self.status = "rejected"
  			return "Transaction rejected. Please check your account balance."
  	end
 	end

def reverse_transfer
if @status == "complete"
	self.receiver.balance -= amount
  	self.sender.balance += amount
  	@status = "reversed"
  end
end


end