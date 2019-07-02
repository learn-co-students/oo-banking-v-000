class Transfer
  # your code here
  attr_accessor :status, :amount;
  attr_reader :sender, :receiver;

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
      @self.sender.valid? && @self.receiver.valid?
  end


  def execute_transaction
    if valid? && @self.sender.balance > @self.amount && @self.status != "complete"
        @self.sender.balance -= @self.amount
        @self.receiver.balance += @self.amount
        @self.status = "complete"
    else
        @self.status = 'rejected'
        "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if execute_transaction
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
    end
  end


end
