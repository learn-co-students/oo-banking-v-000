class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
  	@sender = sender
  	@receiver = receiver
  	@status = status
  	@amount = amount
  end

  def both_valid?
  	return true if sender.valid? and receiver.valid?
  end

  def execute_transaction
  	if self.both_valid? && self.sender.balance > self.amount && self.status == "pending"
  	  until self.status == "complete"
  	    self.receiver.deposit(self.amount)
  	    self.sender.balance -= self.amount
  	    self.status = "complete"
      end
    else
      reject_transfer
    end
  end

  def reject_transfer
  	self.status = "rejected"
  	"Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
  	if self.status == "complete"
  	  self.sender.deposit(self.amount)
  	  self.receiver.balance -= self.amount
  	  self.status = "reversed"
  	end
  end

end