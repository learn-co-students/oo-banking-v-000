require 'pry'

class Transfer
  # your code here
  attr_reader
  attr_accessor :name, :amount, :status, :sender, :receiver

    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
    end

    def valid?
      sender.valid? && receiver.valid? ? true : false
    end

    def execute_transaction
      if valid? == true && sender.balance > @amount && @status == "pending"
      sender.balance = sender.balance - @amount
      receiver.balance = receiver.balance + @amount
      @status = "complete"
    else
      #binding.pry
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if @status == "complete"
        receiver.balance = receiver.balance - @amount
        sender.balance = sender.balance + @amount
        @status = "reversed"
      end
    end

end



=begin





=end
