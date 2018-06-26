class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :BankAccount

  def initialize(sender,receiver,value)
    @sender= sender   #this is an object
    @receiver= receiver  #this is an object
    @status= "pending"
    @amount= value
  end
  def valid?
    if @sender.valid? and @receiver.valid
      return true
    else
      false
    end

  end
end
