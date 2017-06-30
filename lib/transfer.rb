class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @amount = amount
    @receiver = receiver
    @status = 'pending'
  end
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false

    end

  end

  def execute_transaction
    if @sender.valid? && @status == 'pending'
      if @sender.balance >= @amount
          @sender.balance = @sender.balance - @amount
          @receiver.balance = @receiver.balance + @amount
          @status = 'complete'
      else
            @status = 'rejected'
            "Transaction rejected. Please check your account balance."

      end
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  #  binding.pry

  end
  def reverse_transfer
    if @status == 'complete'
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end

end
