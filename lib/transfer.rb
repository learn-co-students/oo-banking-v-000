require 'pry'

class Transfer
attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    # @sender.balance > 0 && @sender.status == "open" ? true : false
    @sender.valid?
    @receiver.valid?
  end

  # def valid?
  #   @status == "open" && @balance > 0 ? true : false
  #   @sender.valid?
  #   @receiver.valid?
  # end

  def execute_transaction
    if @sender.balance > @amount && receiver.status == "open" && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
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
