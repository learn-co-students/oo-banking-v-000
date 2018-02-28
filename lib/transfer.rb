require 'pry'

class Transfer
  
  attr_accessor :status

  attr_reader :sender, :receiver, :amount

  def initialize(from, to, amount)
    @sender = from
    @receiver = to
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true && @amount <= @sender.balance
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == true && self.status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        self.status = "complete"
    else
      self.status ="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
