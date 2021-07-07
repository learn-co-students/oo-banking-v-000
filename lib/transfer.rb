require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction


    if @sender.balance >= @amount && @status != "complete"

      @receiver.deposit(@amount)
      @sender.deposit(0-@amount)
      @status = "complete"

    else

      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(0-@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
