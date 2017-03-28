class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount = 50) # sender and receiver are instances from BankAccount class
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else false
    end
  end

  def execute_transaction
    if valid? && @status == "pending" && sender.balance > amount
      sender.deposit(-amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(amount)
      receiver.deposit(-amount)
      @status = "reversed"
    end
  end
end
