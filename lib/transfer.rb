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
      @sender.balance > @amount && @receiver.valid? && @sender.valid? ? true : false
    end

    def execute_transaction
      # binding.pry
      if self.valid? == false
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      elsif @status != "complete" && self.valid? == true
          @sender.balance = @sender.balance - @amount
          @receiver.balance = @receiver.balance + @amount
          @status = "complete"
      end
    end

    def reverse_transfer
      if self.status == "complete"
        @sender.balance = @sender.balance + @amount
        @receiver.balance = @receiver.balance - @amount
        @status = "reversed"
      end
    end
end
