require "pry"
class Transfer
  attr_accessor :bank_account, :sender, :receiver, :status, :transfer, :amount
  #attr_reader :name

  def initialize(sender, receiver, amount)
    #@name = name
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    #binding.pry
  end

  def valid?
  @sender.valid? && @receiver.valid? && @amount <= sender.balance

  end

  def execute_transaction
    if !valid? || @status == "complete"
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
  else
    sender.balance -= @amount
    receiver.balance += @amount
    @status = "complete"
  end
end

   def reverse_transfer
     if @status == "complete"
     receiver.balance -= @amount
     sender.balance += @amount
     #binding.pry
     @status = "reversed"
    end
   end
end
