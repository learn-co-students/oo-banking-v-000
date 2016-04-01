require 'pry'

class Transfer
  # code here
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status="pending", amount)
        @sender = sender
        @receiver = receiver
        @status = status
        @amount = amount
  end

  def both_valid?
      sender.valid? && receiver.valid?
  end

  def execute_transaction
       if both_valid? && status == "pending" && sender.balance > amount
    self.sender.balance -= amount
        self.receiver.balance += amount
       self.status = "complete"
  else
      reject_transfer
    end

  end
#      it "each transfer can only happen once" do
#         transfer.execute_transaction
#         expect(amanda.balance).to eq(950)
#         expect(avi.balance).to eq(1050)
#         expect(transfer.status).to eq("complete")
#         transfer.execute_transaction
#         expect(amanda.balance).to eq(950)
#         expect(avi.balance).to eq(1050)
#       end





#     describe '#reject_transfer' do
#       it "can reject a transfer if the sender doesn't have a valid account" do
#         expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
#         expect(bad_transfer.status).to eq("rejected")
#       end
#     end
def reverse_transfer
    if both_valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

 def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end






end




