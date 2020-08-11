# class Transfer
#   # your code here
#   attr_accessor :sender, :receiver, :status, :amount
  
#   def initialize(sender, receiver, amount)
#     @sender = sender 
#     @receiver = receiver
#     @status = "pending"
#     @amount = amount
#   end
  
# def valid?
#     if sender.valid? && receiver.valid?
#       true
#     else
#       false
#     end
#   end
  
#   # def execute_transaction(name, sender_account, receiver_account, amount)
#   #   sender_account = BankAccount.new(name)
#   #   receiver_account = BankAccount.new(name)
    
#   #   transfer = Transfer.new(sender_account, receiver_account, amount)
    
#   #   if transfer.amount != sender_account
#   #     nil
#   #   end
#   # end
  
#   def execute_transaction
#     if @sender.balance < @amount
#       @status = "rejected"
#       return "Transaction rejected. Please check your account balance."

#     elsif @status == "complete"
#       puts "Transaction was already excuted"
#     else
#       @sender.deposit( @amount * -1 ) 
#       @receiver.deposit( @amount )
#       @status = "complete"
#     end
#   end
  
#   # def execute_transaction
#   #   if valid? && sender.balance > amount && self.status == "pending"
#   #     sender.withdrawal(self.amount)
#   #     receiver.deposit(self.amount)
#   #     self.status = "complete"
#   #   else
#   #     self.status = "rejected"
#   #     "Transaction rejected. Please check your account balance."
#   #   end
#   # end

  
#   def reverse_transfer
#     if @status == "complete"
#       @sender.deposit( @amount ) 
#       @receiver.deposit( @amount * -1)
#       @status = "reversed"
#     end
#   end
  
  
# end

class Transfer
  # code here
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if  valid? && @sender.balance > @amount && self.status == "pending"
      
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"

    # elsif @status == "complete"
      # puts "Transaction was already excuted"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  # def execute_transaction
  #   if valid? && @sender.balance < @amount && self.status == "pending"
  #   self.status = "rejected"
  #     return "Transaction rejected. Please check your account balance."
  #   elsif @status == "complete"
  #     puts "Transaction was already excuted"
  #   else
  #     @sender.withdrawal(self.amount)
  #     @receiver.deposit(self.amount)
  #     self.status = "complete"
  #   end
  # end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end

end
