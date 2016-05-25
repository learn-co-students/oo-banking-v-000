class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
    @transaction_happened = false
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= @amount
  end


  def execute_transaction
    if valid? && !@transaction_happened
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete" 
      @transaction_happened = true
    else
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @transaction_happened
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed" 
    end
  end


end

  