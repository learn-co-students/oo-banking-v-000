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
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
      if !@sender.valid?
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        self.status = "complete"
        @receiver.deposit(amount)
        @sender.withdraw(amount)
        binding.pry
      end
  end

  def reverse_transfer
      if self.status = "complete"
        @receiver.withdraw(amount)
        @sender.deposit(amount)
        self.status = "reversed"
      else
      end
  end

end
