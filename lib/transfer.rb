require 'pry'

class Transfer

  attr_accessor :balance, :status, :amount
  attr_reader :receiver, :sender

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? #...sweet. So I got to call this from banking_spec.rb
  end


  def execute_transaction()
    #can only happen once
    if @status != "pending" || sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    end
  end


  def reverse_transfer()
    if self.status == "complete"     #can only reverse executed transfers
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    end
  end
end
