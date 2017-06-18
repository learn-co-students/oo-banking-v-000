class Transfer

attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
      @status = "pending"
      @sender = sender
      @receiver = receiver
      @amount = amount
  end

  def valid?
      @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
          ogsender = @sender.balance
      if @sender.valid? && ogsender > @amount && @status == "pending"
          @sender.balance = ogsender - @amount
          ogreceiver = @receiver.balance
          @receiver.balance = ogreceiver + @amount
          @status = "complete"
      else
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if status == "complete"
        ogbalance = @sender.balance
        @sender.balance = ogbalance + @amount
        ogreceiver = @receiver.balance
        @receiver.balance = ogreceiver - @amount
        @status = "reversed"
      end
  end

end
