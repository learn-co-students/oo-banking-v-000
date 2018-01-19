class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = "pending")
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = status
  end

  def valid?
  	sender.valid? 
  	receiver.valid? 
  end

 def execute_transaction
  	@execute_transaction ||= transaction
  end

   def reverse_transfer
  	if self.status == "complete"
  	sender.balance = sender.balance + amount
  	receiver.balance = receiver.balance - amount
  	self.status = "reversed"
  	end
  end
end


private
  def transaction
  	self.status = "complete" if sender.valid?
  	sender.balance = sender.balance - amount
  	receiver.balance = receiver.balance + amount
  	self.status = "rejected" if sender.valid? == false
  	"Transaction rejected. Please check your account balance."
  end
