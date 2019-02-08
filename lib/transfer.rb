require "pry"

class Transfer
  
attr_accessor :sender, :receiver, :amount, :status, :balance
#attr_reader :accounts

def initialize(sender, receiver, amount)
  @sender = sender 
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
  sender.valid? && receiver.valid? 
end

def execute_transaction
  if @status == "pending" && sender.valid?
    receiver.balance = receiver.balance + amount
    sender.balance = sender.balance - amount
    @status = "complete"
  else 
    @status = "rejected"
    puts "Transaction rejected. Please check your account balance."
    end
    #return @status 
    #binding.pry
end

end
