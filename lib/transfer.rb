require 'pry'

class Transfer
#They can be executed and go to a "complete" state. They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.

  attr_accessor :transfer_amount, :name, :sender, :receiver

   def initialize(status, sender, receiver)
      @status = "pending"
      @sender = sender
      @receiver = receiver
      @transfer_amount = 50
   end

    # def sender #initializes w/a sender test for validity (valid?)
    #   @sender
    # end
    #
    # def receiver #initializes w/a receiver test for validity (valid?)
    #     @receiver
    # end
    #
    def status #always initializes w/a status of 'pending'
        @status
    end
    #
    def transfer_amount #initializes w/a transfer amount
        self.transfer_amount
    end

    def valid?(sender, receiver)  #both accounts are valid
      @sender
      @receiver
    end

    def execute_transaction #transfer only once, rejects if invalid acct, can transfer betw 2 if valid
      if valid?
        status = "complete"
      else
        "Transaction rejected. Please check your account balance."
      end
    end

  def reverse_transfer

    #can reverse a transfer betw two accounts
    #it can only reverse executed Transfers
  end

end
