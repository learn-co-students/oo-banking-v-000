require 'pry'
class Transfer

	attr_accessor :sender, :receiver, :amount, :status, :executed
 
  def initialize (sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = "pending"
  	@executed = false
  end

  def both_valid?
  	sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
  	if @status == "pending" && sender.valid? && @amount <= sender.balance then
  		sender.balance = sender.balance - @amount
  		receiver.balance = receiver.balance + @amount
  		@executed = true
  		@status = "complete"
  	else
  		reject_transfer
  	end
  end

  def reject_transfer
  	@status = "rejected"
  	"Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
  	if @status = "complete" && @executed == true then
  		sender.balance = sender.balance + @amount
  		receiver.balance = receiver.balance - @amount
  		@status = "reversed"
  	end
  end
end