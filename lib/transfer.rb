class Transfer

  attr_accessor :sender, :receiver, :amount, :status, :hodl

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    # @sender.balance >= @amount && @sender.status == 'open' && @receiver.status == 'open'
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction

    if valid? && @sender.balance >= amount && @status != 'complete'

      @sender.balance -= @amount
      @receiver.balance += @amount
      @hodl = @amount
      # @amount = 0
      @status = 'complete'



    else
      reject_transfer

    end
  end

    def reverse_transfer
      if @status == 'complete'
        @sender.balance += @hodl
        @receiver.balance -= @hodl
        @status = 'reversed'
      end
    end

    def reject_transfer
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end


end
