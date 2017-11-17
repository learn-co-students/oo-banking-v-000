class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :count


    def initialize(sender, receiver, amount)

        @sender = sender
        @receiver = receiver
        @status = "pending"
        @amount = amount
      end

      def valid?
     if sender.valid? && receiver.valid?
      true
    else
      false
     end
   end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
    else
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
      end
    end


   def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount )
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end
end
