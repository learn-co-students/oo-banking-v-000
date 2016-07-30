require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor :status, :amount


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    #return "peanut butter"

      if sender.balance < amount
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
      unless self.status == "complete"
      self.sender.deposit(-amount)
      self.receiver.deposit(amount)
      self.status = "complete"
    end
      #self.amount = 0
  end

  def reverse_transfer
    # if sender.balance < amount
    #   self.status = "rejected"
    #   return "Transaction rejected. Please check your account balance."
    # end
    if self.status == "complete"
      self.sender.deposit(amount)
      self.receiver.deposit(-amount)
      self.status = "reversed"
    end
  end

end
