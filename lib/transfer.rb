class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = 'pending')
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= self.amount
    # refactored 14 - 18 to one line on 12
    # if @sender.valid? && @receiver.valid? && @sender.balance >= self.amount
    #   true
    # else
    #   false
    # end
  end

  def execute_transaction
    if self.valid? && self.status != 'complete'
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if self.status == 'complete'
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = 'reversed'
    end
  end
end
