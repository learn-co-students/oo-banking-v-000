#require 'pry'
class Transfer
  attr_reader :sender, :receiver, :status, :amount
    def initialize (sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
      #@count = 0
    end
    def valid?#(name)
      @sender.valid? &&
      @receiver.valid? &&
      @sender.balance > @amount
      #binding.pry
    end
    def execute_transaction
      sender_balance =
      @sender.balance.to_i
      receiver_balance =
      @receiver.balance.to_i
       #why is count a string & != Fixnum?
      #binding.pry
      while @status ==
        "pending"
       #c = @amount
        if valid?
          @sender.balance =
          sender_balance - @amount
          @receiver.balance =
          @amount + sender_balance
          @status = "complete"
        else
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        end
      end
    end

    def reverse_transfer
      if @status == "complete" && @status != "pending"
      @sender.balance
      @receiver.balance
      sender_balance = @sender.balance + @amount
      receiver_balance = @receiver.balance - @amount
      @sender.balance = sender_balance
      @receiver.balance = receiver_balance
      #binding.pry
      @status = "reversed"
      #binding.pry
      return sender_balance
      #binding.pry
      return receiver_balance
      #sender_balance = @sender.balance + @amount
      #receiver_balance = @receiver.balance - @amount
      #@sender.balance = sender_balance
      #@receiver.balance = receiver_balance
      end
      #
      end
    end
end
