class Transfer
  # your code here
  #attr_reader :sender, :receiver
  attr_accessor :amount, :status, :sender, :receiver

  def initialize(sender, receiver, amount, status="pending")
    @sender = sender
    @receiver  = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if receiver.valid? == true && sender.valid? == true
      #binding.pry
      return true
    else
      @status = "rejected"
      #binding.pry
      return false #"Transaction rejected. Please check your account balance."
    end
  end

  def execute_transaction
    #binding.pry
    #if @status != "rejected"
    until @status == "complete"
      sender.deposit(-amount)
      receiver.deposit(amount)
      @status = "complete"
    end

    if valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      #binding.pry
    end
  end

  def reverse_transfer
    if @status == "complete"
      until @status == "reversed"

        sender.deposit(amount)
        receiver.deposit(-amount)
        @status = "reversed"
        #binding.pry
      end
    end
  end

end
