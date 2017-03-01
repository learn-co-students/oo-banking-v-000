class Transfer

  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
         @receiver = receiver
         @sender   = sender
         @amount   = amount
         @status   = "pending"
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && valid? == true && sender.balance >= @amount && @amount >=1
     sender.balance = sender.balance - @amount
     receiver.deposit(@amount)
     @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance = receiver.balance - @amount
      sender.deposit(@amount)
      @status = "reversed"
    end

  end


end
