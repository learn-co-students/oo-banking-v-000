require "pry"
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender,receiver,amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end

  def valid?
    @receiver.valid? && @sender.valid? #sender and reiciever are BankAccount objects
  end

  def execute_transaction
    if valid? == true && @status == "pending" && (@sender.balance > @amount)
      #you need to check if status is pending
      #so that it transfers only once.
      #you also need to check if the sender has the money to send the money
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? == true && @status == "complete" && (@receiver.balance > @amount)
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    else
      @status = "rejected"
      "Reverse Transaction rejected. Please check your account balance."
    end
  end
end
