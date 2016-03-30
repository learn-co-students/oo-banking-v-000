class Transfer
  # code here
  attr_accessor :status, :amount, :balance
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && sender.balance > amount
      if @status != "complete"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      end
    else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if both_valid? && receiver.balance > amount && @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end





end