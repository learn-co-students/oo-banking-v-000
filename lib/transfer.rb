require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end #if sender.valid?
  end #def valid?

  def execute_transaction
    if @status != "complete" && sender.balance >= @amount
      sender.withdrawal(amount)
      receiver.deposit(amount)
      @status = "complete"
    elsif
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end #if
  end #def execute_transaction

  def reverse_transfer
    if @status == "complete"
      receiver.withdrawal(amount)
      sender.deposit(amount)
      @status = "reversed"
    end #if
  end #def reverse_transfer

end #class Transfer
