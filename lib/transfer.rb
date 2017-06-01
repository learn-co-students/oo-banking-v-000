class Transfer
  #1) Transfer Transfer initialize can initialize a Transfer
     #Failure/Error: let(:transfer) { Transfer.new(amanda, avi, 50) }
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  #1) Transfer Transfer #valid? can check that both accounts are valid
     #Failure/Error: expect(transfer.valid?).to eq(true)
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  #1) Transfer Transfer #execute_transaction can execute a successful transaction between two accounts
     #Failure/Error: transfer.execute_transaction
 def execute_transaction
   if @amount < @sender.balance && @receiver.valid? && status == "pending"
     @sender.balance -= @amount
     @receiver.balance += @amount
     @status = "complete"
   else
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
   end

   #1) Transfer Transfer #reverse_transfer can reverse a transfer between two accounts
        #Failure/Error: transfer.reverse_transfer

 def reverse_transfer
   if @status == "complete"
   @receiver.balance -= @amount
   @sender.balance += @amount
   @status = "reversed"
 end
 end
end
