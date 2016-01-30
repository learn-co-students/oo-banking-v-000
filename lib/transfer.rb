require 'pry'

class Transfer

attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def amount
    @amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @sender.balance < amount then
      @status = "rejected"
      "Transaction rejected. Please check your account balance." 
    elsif @status !="complete" then
      @sender.balance -= amount
      @receiver.deposit(amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if  @status == "complete" then
      @receiver.balance -= amount
      @sender.deposit(amount)
      @status = "reversed"
    end
  end
end