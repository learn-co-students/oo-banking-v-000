require 'pry'

class Transfer
#Transfers start out in a "pending" status. They can be executed and go to a "complete" state. They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.

   attr_accessor :status, :sender, :receiver

   def initialize(status)
  #   binding.pry
      @status = "pending"
   end

    def transfer
      binding.pry
      transfer = Transfer.new
    end

    def sender #initializes w/a sender test for validity (valid?)
      @sender
    end

    def receiver #initializes w/a receiver test for validity (valid?)
      @receiver
    end

    def status #always initializes w/a status of 'pending'
      @status = "pending"
    end

  def transfer_amount #initializes w/a transfer amount
    @transfer_amount = 50
  end

  def valid?  #both accounts are valid
    #calls on the sender and receivers valid? methods
  end

  def execute_transaction
    #can execute a successful transaction betw two accounts
    #each transfer can only happen once
    #rejects a transfer if the sender doesn't have a valid accounts
  end

  def reverse_transfer
    #can reverse a transfer betw two accounts
    #it can only reverse executed Transfers
  end

end
