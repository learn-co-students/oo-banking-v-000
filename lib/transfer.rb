require 'pry'
class Transfer

attr_accessor :sender, :receiver, :status, :amount, :counter


  def initialize(sender, receiver, amount)
    @status="pending"
    @sender=sender
    @receiver=receiver
    @amount=amount
    @counter = 0
  end

  def valid?
    if   @sender.valid? && @receiver.valid? && self.status == "pending" && @sender.balance > self.amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && @counter == 0
      @receiver.balance += @amount
      @sender.balance -= @amount
      @counter += 1;
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end

  end

end
