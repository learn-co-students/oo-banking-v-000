class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :BankAccount

  def initialize(sender,receiver,value)
    @sender= sender   #this is an object
    @receiver= receiver  #this is an object
    @status= "pending"
    @amount= value
  end
  def valid?
    if @sender.valid? and @receiver.valid? and ( @sender.balance - @amount > 0)

         return true

    else
          @status= "rejected"
          return false
    end
  end
  def execute_transaction
    if self.valid?
         if @status != "complete" and @status != "rejected"
                  @receiver.balance = (receiver.balance + @amount)
                  @sender.balance = (@sender.balance - @amount)
                  @status = "complete"
          end
    else
       return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      @receiver.balance = (receiver.balance - @amount)
      @sender.balance = (@sender.balance + @amount)
      @status = "reversed"
    end
  end

end
