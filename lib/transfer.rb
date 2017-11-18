class Transfer
attr_accessor :sender, :receiver, :amount, :status
  def initialize(send_name, rec_name, money)
    self.sender = send_name
    self.receiver = rec_name
    self.amount = money
    @status = "pending"
    @previous = 0
  end

  def valid?
    @sender.valid? && @sender.balance > self.amount && @receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && self.valid?
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    elsif @sender.balance < self.amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      @status = "reversed"
    end
  end

end
