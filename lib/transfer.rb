require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender = BankAccount.find_by_name(@sender)
    receiver = BankAccount.find_by_name(@receiver)
    sender != nil && receiver != nil && sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid?
      sender = BankAccount.find_by_name(@sender)
      receiver = BankAccount.find_by_name(@receiver)
        sender.balance -= @amount
        receiver.balance += @amount
          @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender = BankAccount.find_by_name(@sender)
      receiver = BankAccount.find_by_name(@receiver)
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
