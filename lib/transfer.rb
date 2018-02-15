require 'pry'

class Transfer
    attr_accessor :sender, :receiver, :amount, :status

    def initialize (sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"

    end


    def valid?
       @sender == sender && @receiver == receiver

      @sender.valid?
      @receiver.valid?

    end

    def execute_transaction
      if @status == "pending"

        @sender.balance -= @amount
          @receiver.balance += @amount
            @status = "complete"

              if @sender.valid? == false
                @status = "rejected"
                "Transaction rejected. Please check your account balance."

              end
            end
          end

      def reverse_transfer
        if @status == "complete"
          @receiver.balance -= @amount
            @sender.balance += @amount
              @status = "reversed"

        end
      end
end
