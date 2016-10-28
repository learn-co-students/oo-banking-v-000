require "pry"
class Transfer
  attr_accessor :sender, :receiver , :status, :amount

  def initialize(send, rec, amt)
      @sender = send
      @receiver = rec
      @amount = amt
      @status = "pending"
  end

  def valid?
      self.sender.valid? && self.receiver.valid? && self.sender.balance>=self.amount
  end

  def execute_transaction
      if valid? && self.status != "complete"
          self.sender.deposit(-self.amount)
          self.receiver.deposit(self.amount)
          self.status = "complete"
      else
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
      if self.status == "complete"
          self.sender.deposit(self.amount)
          self.receiver.deposit(-self.amount)
          self.status = "reversed"
      end
  end
end
