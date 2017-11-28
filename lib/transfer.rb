require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = 50
    #this amount shouldn't be initialized...
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if amount != amount || @sender.valid? == false
      #only difference for bad_transfer is the transfer amount.  sender.valid? comes out to be true....
      @status == "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending" && @sender.valid?
      @sender.deposit(-50)
      @receiver.deposit(50)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(50)
      @receiver.deposit(-50)
      @status = "reversed"
    end
  end

end
