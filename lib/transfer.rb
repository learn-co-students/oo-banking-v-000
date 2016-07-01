class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  @@all_executed_transfers = []

  def initialize(sender, receiver, amount)
    @sender= sender
    @receiver= receiver
    @amount= amount
    @status= "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? && @@all_executed_transfers.include?(self) == false
      if (@sender.balance - @amount < 0) == true
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        @sender.balance -= @amount
        @receiver.balance += @amount
        self.status = "complete"
        @@all_executed_transfers << self
      end
    end
  end

  def reverse_transfer #only can reverse itself if self is a successfuly executed transfer
    if self.status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = "reversed"
    end
  end

end
