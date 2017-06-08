require 'pry'

class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

    def execute_transaction
      if sender.valid? == true && @status == "pending" && sender.balance >= amount
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      else reject_transfer
      end
    end

    def reject_transfer
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end

    def reverse_transfer
      if @status == "complete"
        sender.balance += amount
        receiver.balance -= amount
        @status = "reversed"
      end
    end
end
