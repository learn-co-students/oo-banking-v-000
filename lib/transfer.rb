require "pry"

class Transfer
  attr_accessor :name, :amount, :status, :sender, :receiver

  def initialize(name, receiver, amount)
    @name = name
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @sender = name
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  # @receiver.balance = @receiver.balance + @receiver.deposit(amount) #add the transfer amount (@amount) to the receiver account
  # @receiver.balance
  #need to have a deposit amount increase the balance in the receiver account
  #add the transfer amount (@amount) to the receiver account
  def execute_transaction
    # binding.pry
    if valid? == true && (@sender.balance >= @amount) && @status == "pending"
      @sender.balance -= amount # 50
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? == true && (@receiver.balance >= @amount) && @status == "complete"
    @receiver.balance -= amount
    @sender.balance += amount
    @status = "reversed"
  end
end

end
