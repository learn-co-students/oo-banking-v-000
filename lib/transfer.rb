require 'pry'
class Transfer
attr_reader :sender, :receiver
attr_accessor :amount, :status
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = status
  end
  
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end
  
  def execute_transaction
    #Transfer.new(sender, receiver, amount, status)
    if @status == "pending"
     # binding.pry
      if sender.balance < amount
        "Transaction rejected. Please check your account balance."
      elsif sender.balance >= amount
         sender.balance = sender.balance-amount
         receiver.balance = receiver.balance+amount
         @status = "complete"
      end
    end
  end
      
      
      #if sender.balance < amount
       # return "Transaction rejected. Please check your account balance."
      #elsif sender.balance >= amount
       # sender.balance = sender.balance-amount
        #sender.balance
       # receiver.balance = receiver.balance+amount
       # receiver.balance
        #transfer.status == "complete"
      #end
    #elsif transfer.status == "complete"
     # transfer.status
    #end
    
  # binding.pry
    
    
    #if @status == "pending"
      #if sender.balance >= amount
        #sender.balance = sender.balance-amount
       # sender.balance
       # receiver.balance = receiver.balance+amount
       # receiver.balance
       # @status = "complete"
      #elsif sender.balance < amount
     #   return "Transaction rejected. Please check your account balance."
     # elsif @status == "complete"
     #   @status
     # end
    
    #end
    #if @status == "pending"
      #if sender.balance < amount
      #  return "Transaction rejected. Please check your account balance."
      #elsif sender.balance > amount
      #  sender.balance = sender.balance-amount
       # sender.balance
       # receiver.balance = receiver.balance+amount
       # receiver.balance
       # @status = "complete"
      #end
    #elsif @status == "complete"
    #end
    
  
  
  

end
