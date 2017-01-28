class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @amount_record = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? && sender.balance >= @amount
      receiver.deposit(@amount)
      sender.balance = sender.balance - @amount
      @amount = 0
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
     sender.balance = sender.balance + @amount_record
     receiver.balance = receiver.balance - @amount_record
     @status = "reversed"
   else
     @status
   end
 end

end
