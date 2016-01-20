require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.both_valid? == false || self.balance_check == false
      self.reject_transfer
      return "Transaction rejected. Please check your account balance."
    else
      unless @status == "complete"
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      end
    end
  end

  def balance_check
     sender.balance - self.amount > 0 ? true : false
  end

  def reject_transfer
    @status = "rejected"
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance -= self.amount
      sender.balance += self.amount
      @status = "reversed"
    end
  end
end


