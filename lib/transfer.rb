require 'pry'
class Transfer
  require 'pry'
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount=50)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  end 

  def both_valid?
  	if @sender.valid? == true && @receiver.valid? == true
  		true
  	else
  		false
  	end
  end

  def execute_transaction
  	if @sender.valid? == false
  		puts "Transaction rejected. Please check your account balance."
  		self.reject_transfer
  	elsif @sender.valid? == true && @status == "pending"
  		@sender.balance -= @amount
  		@receiver.balance += @amount
  		@status = "complete"
  	end
  end

  def reject_transfer
  		@status = "rejected"
  end

  def reverse_transfer
  	if @status == "complete"
  		@sender.balance += @amount
 		@receiver.balance -= @amount
  		@status = "reversed"
  	end
  end

end

