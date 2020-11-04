class Transfer
  # your code here

  #belongs_to :BankAccount 
  attr_accessor :sender, :receiver, :amount, :status

	#has_many :transfers 

   def initialize(sender, receiver, amount, status = 'pending')
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = status
   end

   def execute_transaction
   	  if self.sender.valid? && self.receiver.valid? && self.status != 'complete'
        self.receiver.balance = self.amount + self.receiver.balance 
        self.sender.balance = self.sender.balance - self.amount 
        self.status = 'complete'
   	  elsif self.sender != valid?
   	  	self.status = 'rejected'
   	  	return "Transaction rejected. Please check your account balance."
   	  end
   end

   def reverse_transfer
   	  self.receiver.balance = self.receiver.balance - self.amount 
   	  self.sender.balance = self.sender.balance + self.amount 
   	  self.status = 'reversed'
   end

   def valid?
   	  self.sender.valid? && self.receiver.valid? 
   end

end
