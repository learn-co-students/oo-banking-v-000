class Transfer

  # attr_accessor :name, :status

  def initialize(transfer)
    @transfer = transfer
  end

  # def transfer
  #   @transfer
  # end

  def sender
    @sender = sender
  end

  def receiver
    @receiver = receiver
  end

  def status
    @status = "pending"
  end

  def transfer_amount
    @transfer_amount
  end

  def valid?
    #both accounts are valid
    #calls on the sender and receivers valid? methods
  end

  def execute_transaction
    #can execute a successful transaction betw two accounts
    #each transfer can only happen once
    #rejects a transfer if the sender doesn't have a valid accounts
  end

  def reverse_transfer
    #can reverse a transfer betw two accounts
    #it can only reverse executed Transfers
  end

end
