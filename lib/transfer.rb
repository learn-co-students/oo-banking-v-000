class Transfer
  # your code here

  #Transfer class acts as a space for a transaction between two instances of the BankAccount class

  #Transfer instances runs checks first before transfer is complete
  #Transfer instances can reject a transfer if the BankAccount accounts aren't valid or if sender doesn't have the money.

  #Transfer start as a "pending" status
  # once executed turns into a "complete" status/state
  #statuses = "pending", "complete", "rejected", "reversed"
  #completed transfer can be reversed and go into "reversed" status

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount) #initializes with a sender, receiver, amount
    @sender = sender #expect(transfer.sender).to eq(amanda)
    @receiver = receiver #expect(transfer.receiver).to eq(avi)
    @status = "pending" #always initializes with a status of 'pending'; expect(transfer.status).to eq("pending")
    @amount = amount #expect(transfer.amount).to eq(50)
  end

  def valid? #can check that both accounts are valid
    # expect(avi.valid?).to eq (true) => receiver
    # expect(amanda.valid?).to eq(true) => sender
    # expect(transfer.valid?).to eq(true)
    # - calls on the sender and receiver's #valid? methods

    # transfer_class = File.read("lib/transfer.rb")
    #
    # expect(amanda).to receive(:valid?).and_return(true)
    # expect(avi).to receive(:valid?).and_return(true)
    #
    # transfer.valid?

    sender.valid? && receiver.valid? #valid? from BankAccount class instance method
  end

  def execute_transaction #can execute a successful transaction between two accounts

    # transfer.execute_transaction
    # expect(amanda.balance).to eq(950) sender
    # expect(avi.balance).to eq(1050) receiver
    # expect(transfer.status).to eq("complete")

    if valid? && sender.balance > amount && self.status == "pending" #(Transfer valid? method)
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end

    # - each transfer can only happen once
    #   transfer.execute_transaction
    #   expect(amanda.balance).to eq(950) sender
    #   expect(avi.balance).to eq(1050) receiver
    #   expect(transfer.status).to eq("complete")
    #   transfer.execute_transaction
    #   expect(amanda.balance).to eq(950)
    #   expect(avi.balance).to eq(1050)

    # - rejects a transfer if the sender doesn't have a valid account
    #   expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
    #   expect(bad_transfer.status).to eq("rejected")
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction #{self.status}. Please check your account balance."
  end

  def reverse_transfer #can reverse a transfer between two accounts
    # transfer.execute_transaction
    # expect(amanda.balance).to eq(950) sender
    # expect(avi.balance).to eq(1050) receiver
    # transfer.reverse_transfer
    # expect(avi.balance).to eq(1000)
    # expect(amanda.balance).to eq(1000)
    # expect(transfer.status).to eq("reversed")

    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
    # - it can only reverse executed transfers
    #   transfer.reverse_transfer
    #   expect(amanda.balance).to eq(1000)
    #   expect(avi.balance).to eq(1000)

    #self.execute_transaction
  end

end
