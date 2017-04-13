require 'pry'

class Transfer

attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount
  end

  def execute_transaction
      if valid? && status == "pending"
        receiver.deposit(amount)
        sender.withdraw(amount)
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."

      end
  end

  def reverse_transfer
      if self.status == "complete"
        receiver.withdraw(amount)
        sender.deposit(amount)
        self.status = "reversed"
      else
      end
  end

end
