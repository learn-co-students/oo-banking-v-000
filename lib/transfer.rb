require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(from_account, to_account, sum)
    @sender = from_account
    @receiver = to_account
    @status = "pending"
    @amount = sum
  end

  def valid?
    self.receiver.valid? && self.sender.valid? && (self.sender.balance >= self.amount) #last condition is not good(
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer #there is a room to make this method better by validating
    if self.status == "complete"
      #binding.pry
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end


end
