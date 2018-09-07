class Transfer

  attr_accessor :receiver, :amount
  attr_reader :sender, :status

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
      if valid? && @sender.balance > @amount && @status == "pending"
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
        # binding.pry
      # elsif
      #    valid? && @status == "pending" && @sender.balance < @amount
      #   @status = "Transaction rejected. Please check your account balance."
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
   end

  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end


end
