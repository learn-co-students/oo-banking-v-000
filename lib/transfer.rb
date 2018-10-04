class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount) 
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    end
    
    def valid?
      @sender.valid? && @receiver.valid? ? true : false 
    end 
 
def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

end
     
     
      
