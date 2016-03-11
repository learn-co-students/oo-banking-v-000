class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize (sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = 'pending'
  end

  def both_valid?
  	self.sender.valid? && self.receiver.valid? && self.status == 'pending'
  end

  def execute_transaction
  	if self.sender.balance < self.amount
  		self.status = 'rejected'
  		'Transaction rejected. Please check your account balance.'
  	elsif self.both_valid?
  		sender.deposit(-amount)
  		receiver.deposit(amount)
  		self.status = 'complete'
  	end
  end

  def reverse_transfer
  	reversal = Transfer.new(self.receiver, self.sender, amount)
  	reversal.execute_transaction if self.status == 'complete'
  	self.status = 'reversed'
  end
end