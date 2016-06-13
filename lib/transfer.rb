require 'pry'

class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

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
    if sender.valid?
      return
        @sender.balance = sender.balance - @amount
        @receiver.balance = receiver.balance + @amount
        @status = "complete"
      else
        @status = "reject"
      end

  end

  def reverse_transfer

  end

end
