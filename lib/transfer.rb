class Transfer
  # code here
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = 'pending'
  end

  def both_valid?
  	sender.valid? && receiver.valid?
  end

  def execute_transaction
  	if status == 'pending'
	  	sender.balance -= amount
	  	receiver.balance += amount
	end
  	@status = 'complete'
  	reject_transfer
  end

  def reject_transfer
  	unless sender.valid?
		@status = 'rejected'
		"Transaction rejected. Please check your account balance."
	end
  end

  def reverse_transfer
  	if status == 'complete'
	  	receiver.balance -= amount
	  	sender.balance += amount
    end
  	@status = 'reversed'
  	reject_transfer
  end

end