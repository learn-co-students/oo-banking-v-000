require 'pry'
class Transfer
  attr_accessor :status, :sender, :receiver, :amount, :all
  @@all = []

  def initialize(sender,receiver,amount)
    @@all << @amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def self.all
    @@all
  end


  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount
  end

  def execute_transaction
    if @status == "pending" && valid?
      sender.deposit(-amount)
      receiver.deposit(amount)
      @status = "complete"
    elsif !valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(amount)
      receiver.deposit(-amount)
      @status = "reversed"
    end
  end
end
