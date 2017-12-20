require "pry"
class Transfer

  attr_reader :sender, :receiver, :amount, :status


def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
end

def valid?
  if sender.valid? && receiver.valid? && sender.balance > amount
    true
  else
    false
  end
end

def do_nothing
end

def execute_transaction
  if @status == "complete"
    do_nothing
  elsif !valid?
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  elsif valid?
    receiver.deposit(amount)
    sender.deduct(amount)
    @status = "complete"
  end
end

def reverse_transfer
  if @status == "complete"
    receiver.deduct(amount)
    sender.deposit(amount)
    @status = "reversed"
  end
end


end
