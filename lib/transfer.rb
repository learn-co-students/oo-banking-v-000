class Transfer
  attr_accessor :status 
  attr_reader :sender, :receiver, :amount 

  def initialize(sender, receiver, amount) 
  	@sender = sender 
  	@receiver = receiver 
  	@amount = amount 
  	@status = 'pending' 
  end 

  def valid? 
  	self.sender.valid? && self.receiver.valid?  
  end 

  def execute_transaction 
  		self.receiver.deposit(self.amount) && self.sender.deposit(-self.amount) if self.status == 'pending' 
  		valid? ? self.status = 'complete' : self.status = 'rejected' 
  		"Transaction rejected. Please check your account balance." if self.status == 'rejected'
  end 

  def reverse_transfer 
  	 self.receiver.deposit(-self.amount) && self.sender.deposit(self.amount) if self.status == 'complete' 
  	 self.status = 'reversed' 
  end 

end
