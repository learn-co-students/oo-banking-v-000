require 'pry'
class Transfer
  # your code here

attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

    def valid?
      if  @sender.valid? && @receiver.valid? == true
        return true
      else
        false
      end
    end

    def execute_transaction

    #  binding.pry
      if @sender.balance < @amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif @sender.valid? == true && @status != "complete"
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"

      end
    end


    def reverse_transfer
      #binding.pry
      if @sender.valid? == false
        @satus = "rejected"
        return "Transaction rejected. Please check your account balance."

      elsif  @status == "complete"

      #  binding.pry
        @receiver.balance = @receiver.balance - @amount
        @sender.balance = @sender.balance + @amount
        @status = "reversed"
      end
    end

end
