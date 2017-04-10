require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    sender.valid? && receiver.valid?
  end
  def execute_transaction
    if sender.balance > self.amount && self.status == "pending"
      receiver.deposit(self.amount)
      sender.deposit(-self.amount) #deposit 에서 += 를 썼더니 에러가 난거였음.
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if self.status == "complete"
      receiver.deposit(-self.amount)
      sender.deposit(self.amount)
      self.status = "reversed"
    end
  end
end
