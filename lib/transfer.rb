class Transfer

attr_reader :sender, :receiver, :amount
attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? == true && receiver.valid? == true ? true:false
  end

  def execute_transaction
    if self.status == "pending" && sender.balance > amount
      sender.balance-=self.amount
      receiver.balance+=self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance +=amount
      receiver.balance-=amount
      self.status = "reversed"
    end
  end

end
