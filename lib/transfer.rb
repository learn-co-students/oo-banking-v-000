class Transfer

  attr_accessor :receiver, :sender, :amount, :status, :BankAccount

  def initialize(sender, receiver, amount)

    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def both_valid?

    @sender.valid? && @receiver.valid?
  end


  def execute_transaction

    unless @status == "complete" || !(both_valid?)
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end

    if !(both_valid?)
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end


end
