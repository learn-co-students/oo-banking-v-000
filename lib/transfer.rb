class Transfer
  # your code here
  # lab puts code in already????
  attr_reader :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    # @receiver.valid? && @sender.valid? ? true : false
      if @receiver.valid? && @sender.valid?
         true
       else
         false
      end
  end
  
  def execute_transaction
    if valid? && @sender.balance >= @amount && @status == "pending"
      # @sender.balance-=@amount
      @sender.balance = @sender.balance - @amount
      # @receiver.balance+=@amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      # @receiver.balance-=@amount
      @receiver.balance = @receiver.balance - @amount
      # @sender.balance+=@amount
      @sender.balance = @sender.balance + @amount
      @status = "reversed"
    end
  end
  
end
