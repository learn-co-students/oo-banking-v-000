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
  	@sender.valid? && @receiver.valid?  
  end 

  def execute_transaction 
  		@receiver.deposit(@amount) && @sender.deposit(-@amount) if @status == 'pending' 
  		valid? ? @status = 'complete' : @status = 'rejected' 
  		"Transaction rejected. Please check your account balance." if @status == 'rejected'
  end 

  def reverse_transfer 
  	 @receiver.deposit(-@amount) && @sender.deposit(@amount) if @status == 'complete' 
  	 @status = 'reversed' 
  end 

end
