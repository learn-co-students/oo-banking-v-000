require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.deposit(-1*@amount)
      receiver.deposit(@amount)
      @amount_save = @amount
      @amount = 0
      @status = "complete"
    end
  end

  def self.reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(@amount_save)
      receiver.deposit(-1*@amount_save)
      @status = "reversed"
    end
  end


end
