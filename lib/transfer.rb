require 'pry'

class Transfer

  attr_accessor :status

  attr_reader :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && both_valid? && sender.balance > amount
      @receiver.balance +=@amount
      @sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    end

  end

  def reject_transaction
    if !sender.valid?
      return "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer

    if @status == "complete" && both_valid? && receiver.balance > amount
      @sender.balance +=@amount
      @receiver.balance -= @amount
      @status = "reversed"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    end
  end





end