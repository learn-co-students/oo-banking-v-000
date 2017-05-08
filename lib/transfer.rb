class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else false
    end
  end

  def execute_transaction
#    if @count = 0
      if sender.balance < @amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif @status == "complete"
        sender.balance
        receiver.balance
      else 
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      end
    end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
