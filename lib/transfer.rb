class Transfer

  attr_accessor :amount
  attr_reader :sender, :receiver, :status

    def initialize(sender, receiver, status)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = 50

    end

   def valid?
    @sender.valid?
    @receiver.valid?
  end


  def execute_transaction
    if self.valid? && @status == "pending"
      # binding.pry
      @sender.balance = @sender.balance - self.amount
      @receiver.balance = @receiver.balance + self.amount
        @status = "complete"

    else
      "Transaction rejected. Please check your account balance."
      @status = "rejected"

    end
  end

  def reverse_transfer
      if @status == "complete"
        @sender.balance = @sender.balance + self.amount
        @receiver.balance = @receiver.balance - self.amount
        @status = "reversed"
      end
  end

end
