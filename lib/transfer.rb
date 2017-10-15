require "pry"

class Transfer
  attr_accessor :name, :amount, :status, :sender, :receiver

  def initialize(name, receiver, amount)
    @name = name
    @receiver = receiver
    @amount = 50
    @status = "pending"
    @sender = name
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if valid? == true  #once the Transfer.valid? is true,
      @sender.balance - @receiver.deposit(amount)
      @receiver.balance = @receiver.balance + (@sender.balance - @receiver.deposit(amount)) #add the transfer amount (@amount) to the receiver account
      @sender.balance
    #need to have a deposit amount increase the balance in the receiver account
    end
  end

end
