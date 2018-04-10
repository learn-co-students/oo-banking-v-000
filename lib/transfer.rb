require "pry"

class Transfer
  attr_accessor :receiver , :sender , :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.bankaccount.valid?
  end

  def execute_transaction
  end

end
