require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    #binding.pry
    @amount = amount
    @sender = sender
    @receiver = receiver 
    @status = 'pending'
  end 
  
  def valid?
    @sender.valid? && @receiver.valid? 
  end 
  
 def execute_transaction
		@current_amount = @amount
		if sender.balance >= @amount
			sender.balance -= @amount
		else
			@status = "rejected"
			return "Transaction rejected. Please check your account balance."
		end
		receiver.balance += @amount
		@status = "complete"
		@amount = 0
	end 
  
  def reverse_transfer
    #binding.pry
    if status == 'complete'
      sender.balance += @current_amount
      receiver.balance -= @current_amount
      @status = 'reversed'
    end
  end 
end
