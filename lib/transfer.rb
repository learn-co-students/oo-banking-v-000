class Transfer
    attr_accessor :sender, :receiver, :amount, :status

    def initialize(sender, receiver, amount, status='pending')
        @sender = sender
        @receiver = receiver
        @amount = amount
        @status = status
    end

    def valid?
        @status != 'closed' && @amount > 0 ? true : false
    end

    def both_valid?
        sender.valid? && receiver.valid?
    end

    def execute_transaction
        if both_valid? && @sender.balance - amount > 0 && @status != 'complete'
            @sender.balance -= amount
            @receiver.balance += amount
            @status = 'complete'
        else
            @status = 'rejected'
            'Transaction rejected. Please check your account balance.'
        end
    end

    def reverse_transfer
        if @status == 'complete'
            @sender.balance += amount
            @receiver.balance -= amount
            @status = 'reversed'
        end
    end
end
