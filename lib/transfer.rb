class Transfer

#can only read receiver, cannnot change per lab.
	attr_reader :receiver

	attr_accessor :sender, :amount, :status

	#can initialize a Transfer
    #initializes with a sender
    #initializes with a receiver
    #always initializes with a status of 'pending'
    #initializes with a transfer amount

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@status = "pending"
		@amount = amount
	end


	#can check that both accounts are valid
	#calls on the sender and reciever's #valid? methods
	#links back to 'valid?' method created in BankAccount class
	def valid?
		sender.valid? && receiver.valid?
	end


  #can execute a successful transaction between two accounts
  #each transfer can only happen once
  #rejects a transfer if the sender doesn't have a valid account
  def execute_transaction
  	#senders balance must be greater than the aomount being sent.
  	#to insure the transfer only happens once, the status must be "pending"
  	if valid? && sender.balance > amount && status == "pending"
  	sender.balance -= amount
  	receiver.balance += amount
  	@status = "complete"
  else
  	@status = "rejected"
  	"Transaction rejected. Please check your account balance."
  end
  end

#can reverse a transfer between two accounts
#it can only reverse executed transfers
#same as execute_transaction, only reversed as we are reversing the transaction
  def reverse_transfer
  	if valid? && receiver.balance > amount && status == "complete"
  		receiver.balance -= amount
  		sender.balance += amount
  		@status = "reversed"
  	end

  end

end
