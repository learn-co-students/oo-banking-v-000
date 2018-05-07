class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver
  
  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer_amount
  end
   
  def valid?
    sender.valid? && receiver.valid? && sender.balance > self.amount
  end

  def execute_transaction
    if sender.balance > self.amount && @status == "pending"
      receiver.balance << self.amount
      sender.balance -= self.amount
      receiver.balance += self.amount
      @status = "complete"
    else
      !sender.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
   end
 
   def reverse_transfer
      if @status == "complete"
        sender.balance += self.amount
        receiver.balance -= self.amount
        @status = "reversed"
   end
 end
end
