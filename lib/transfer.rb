require 'pry'

class Transfer #money transfers btw two bank accounts
  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount) #take in 2 bankaccounts! one is a sender and one is a receiver
    @status = "pending" #this does NOT go into the arguments bc the method is not being told what its status will be, it is always "pending" when a new instance is created. Transfer itself = amount, 2 acconts, and the status (the method takes in the arguments of the bank accounts and amount) The Transfer class will change around the status.
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true #don't I need instance var here?
      return true
    else
      false
    end
  end
    #@sender.self? no argument needed, just calling the method on the instance
    #self is the instance that is created (holds the sender and the receiver objects and their attributes which I need to access to determine if the accounts are valid or not)
    #if @sender's status = open and balance > 0 && @receiver's status = open and balance > 0, both valid. true
    #how to call on the bankaccount class without passing in an argument here?!?!? maybe I can make sender and reciever attr_reader's in bank account and then I can use that method???

  def execute_transaction
    if self.valid? == true && @sender.balance > @amount && @status == "pending"
      @sender.deposit(@amount * -1) && @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status != "complete"
      puts "Cannot reverse because no transaction occured."
    else  @status = "complete"
      @sender.deposit(@amount) && @receiver.deposit(@amount * -1)
      @status = "reversed"
    end
  end


end
