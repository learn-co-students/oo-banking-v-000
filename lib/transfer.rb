class Transfer
  # your code here
  attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && self.sender.balance >= self.amount &&
       self.receiver.deposit(self.amount)
       self.sender.deposit(self.amount*-1)
       self.status = "complete"
    else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      #self.status = "pending"
      reversal = Transfer.new(self.receiver,self.sender,self.amount)
      reversal.execute_transaction
      self.status = "reversed"
    end
  end

end
