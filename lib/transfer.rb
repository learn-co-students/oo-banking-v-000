require 'pry'

class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status, :executed

  def initialize(sender, receiver, amount)
    @transfer
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?

  end

  def execute_transaction
    
    if sender.valid? && sender.balance > amount && @status == "pending" 
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
