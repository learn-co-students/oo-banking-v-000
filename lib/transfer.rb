class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if self.valid? && self.status == "pending" && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status ="reversed"
    else
      self.status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end


avi= BankAccount.new("Avi")
amanda= BankAccount.new("Amanda")
 t1 = Transfer.new(amanda, avi, 50)
  t2 = Transfer.new(amanda, avi, 4000)

  t1.execute_transaction
