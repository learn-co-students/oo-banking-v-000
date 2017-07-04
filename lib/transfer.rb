# first attempt 6/27/17
# require 'pry'
# class Transfer
#   attr_accessor :sender, :receiver, :amount, :status
#
#   def initialize(sender,receiver,amount)
#     @sender = sender
#     @receiver = receiver
#     @status = "pending"
#     @amount = amount
#   end
#
#   def valid?
#     self.sender.valid? && self.receiver.valid?
#   end
#
#   def execute_transaction
#     #binding.pry
#     if self.status == "pending" && valid? && sender.balance > amount
#       sender.balance -= amount
#       receiver.balance += amount
#       self.status = "complete"
#     else
#       self.status = "rejected"
#       "Transaction rejected. Please check your account balance."
#     end
#   end
#
#   def reverse_transfer
#     if self.status == "complete"
#       sender.balance += amount
#       receiver.balance -= amount
#       self.status = "reversed"
#     end
#   end
# end

# second attempt 7/4/17
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # why do you need self.status but not self.receiver or self.sender when you are defining the #execute_transfer method?
      # you don't need self.receiver or self.sender here because they already refer to instances of the BankAccount class
    if valid? && self.status == "pending" && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
