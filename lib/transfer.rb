require 'pry'
class Transfer

  attr_accessor :status, :amount, :receiver, :sender
    
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 

  def both_valid?

   @sender.valid? && @receiver.valid? ? true : false 

  

  end 

end