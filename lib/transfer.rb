require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true && sender.balance >= @amount
      true
    else
      false
    end
    # tools at your disposal, sender.valid?, receiver.valid?, self.amount, sender.balance, receiver.balance
  end

  def execute_transaction
    if self.valid? == true && @status != "complete"
      receiver.balance = self.amount + receiver.balance
      sender.balance = sender.balance - self.amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance = self.amount + sender.balance
      receiver.balance = receiver.balance - self.amount
      @status = "reversed"
    else
      nil
    end
  end

end
