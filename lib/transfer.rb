class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end
	
	def valid?
		x = BankAccount.new("Avi")
		y = BankAccount.new("Amadafdada")
		x.valid? && y.valid?
	end
  
end
