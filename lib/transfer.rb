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
      reject_transfer
      end
  end

  def reject_transfer
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == 'complete'
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = 'reversed'
    end
  end
end
