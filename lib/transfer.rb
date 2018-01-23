require 'pry'
class Transfer
attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    switch = false
    switch = true if @sender.valid? == true && @receiver.valid? == true
    switch
  end

  def execute_transaction
    transaction_count = 0
    if sender.valid? == true && transaction_count == 0
      @receiver.balance += @amount
      @sender.balance -= @amount
      #binding.pry
      @status = "complete"
      transaction_count += 1
    else
      @status = "Transaction rejected. Please check your account balance."
    end
    @status
  end

  def reverse_transfer

  end



end
