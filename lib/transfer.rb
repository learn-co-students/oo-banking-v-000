class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false 
    end
  end
  
  def execute_transaction
    while self.status == "pending"
    if self.valid? == false && sender.balance < amount
      self.status = "rejected"
      puts "Transaction rejected. Please check your account balance."
    else
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end
end
end

  #def execute_transaction
    #while self.status == "pending"
      #if self.valid?
        #sender.balance -= amount
        #receiver.balance += amount
        #self.status = "complete"
      #else
        #puts "Transaction rejected. Please check your account balance."
        #self.status = "rejected"
      #end
    #end
  #end
#end
