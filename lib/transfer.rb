require 'pry'
class Transfer
  @@all = []
  @@executed = []
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end
  def execute_transaction
    # binding.pry
    if valid? == true && @@executed.include?(self) == false && @amount > @sender.balance == false
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
      @@executed << self
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @@executed.include?(self)
      @sender.balance += @amount
      @receiver.balance -= @amount
      @@executed.delete(self)
      @@all.delete(self)
      self.status = "reversed"
    end
  end
end
