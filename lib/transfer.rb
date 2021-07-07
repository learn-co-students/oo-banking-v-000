class Transfer
  attr_accessor :status, :execute_more
  attr_reader :sender, :receiver, :amount

  def initialize(name1, name2, amount)
    @sender = name1
    @receiver = name2
    @status = "pending"
    @amount = amount
    @execute_more = false
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && @execute_more == false
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
      @execute_more = true
    end
    if !@sender.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @execute_more == true
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
    end
    @status = "reversed"
  end
end
