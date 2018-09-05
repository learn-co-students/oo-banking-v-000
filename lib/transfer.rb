class Transfer
  attr_accessor :amount, :status, :temp_amount   
  attr_reader :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end 
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else 
      false 
    end 
  end 
  
   def execute_transaction
    
    if sender.balance < amount 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif status == "complete"
      puts "This transaction was already executed."
  
    else 
       @receiver.balance += amount
       @sender.balance -= amount
       @status = "complete"
     end 
    
    
  end 
  
  def reverse_transfer 
        if @status == "complete" 
          @status = "reversed"
          @amount = -(amount)
          self.execute_transaction
          @status = "reversed"
        end 
      
  end 
   
 
  
end
