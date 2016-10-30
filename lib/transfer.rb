class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(s,r,a) @sender=s; @receiver=r; @amount=a; @status="pending" end
  def valid?() (@sender.valid? && @receiver.valid?) end
  def execute_transaction()
  if self.valid? && @status=="pending" && @sender.balance>@amount
    @status="complete"
    @sender.balance-=@amount
    @receiver.balance+=@amount
  else
    @status="rejected"
    return "Transaction rejected. Please check your account balance."
  end
end
  def reverse_transfer()
    if @status=="complete"
      @status="reversed"
      @sender.balance +=@amount
      @receiver.balance -=@amount
    end
  end
  # your code here
end
