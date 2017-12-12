class Transfer
  # your code here
  attr_accessor :receiver, :sender, :status, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @receiver = receiver
    @sender = sender
    @amount = amount
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction

      if valid? && sender.balance > amount && @status != "complete"
         sender.balance -= amount
         receiver.balance += amount
         @status = "complete"
       else
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
       end
     end

     def reverse_transfer
    if valid? && sender.balance > amount && @status == "complete"
      sender.balance += amount
       receiver.balance -= amount
       @status = "reversed"
       end

end 
end
