require 'pry'

class Transfer
	attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  end

  def valid?
  	if sender.valid? && receiver.valid? && @status == "pending"
  		true
  	else
  		false
  	end
  end

  def execute_transaction
  	if self.valid? && sender.balance > amount 
  		receiver.deposit(amount)
  		sender.balance -= amount
  		@status = "complete"
  	else
  		@status = "rejected"
  		"Transaction rejected. Please check your account balance."
  	end

  end

  def reverse_transfer
  	if @status == "complete"
  		sender.deposit(amount)
  		receiver.balance -= amount
  		@status = "reversed"
  	end
  end

end
