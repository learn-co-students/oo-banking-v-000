require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  # your code here

  def valid?
    if sender = amount > 0 && status == "pending"
      true
    else
      false
    end
    # binding.pry

  end

# Transfer instances should be able to reject a transfer if the accounts aren't valid or if the sender
# doesn't have the money.
# Transfers start out in a "pending" status. They can be executed and go to a "complete" state.
# They can also go to a "rejected" status. A completed transfer can also be reversed and go into a "reversed" status.
#

end
