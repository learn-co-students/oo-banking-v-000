class BankAccount
  #one instance of the class can transfer money to another instance through a Transfer class

  attr_accessor :balance, :status
  attr_reader :name #can't change its name; expect { avi.name = "Bob" }.to raise_error

  def initialize(name)
    @name = name #initializes with a name; expect(avi.name).to eq("Avi")
    @balance = 1000 #always initializes with balance of 1000; expect(avi.balance).to eq(1000)
    @status = "open" #always initializes with a status of 'open'; expect(avi.status).to eq("open")
  end

  def deposit(deposit_amount) #can deposit money into its account
    self.balance += deposit_amount #(another way to write it = @balance = @balance + deposit)
    # expect(avi.balance).to eq(1000)
    # avi.deposit(1000)
    # expect(avi.balance).to eq(2000)
  end

  def display_balance #can display its balance
    "Your balance is $#{@balance}."
    # expect(avi.display_balance).to eq("Your balance is $#{avi.balance}.")
  end

  def valid? # is valid with an open status and a balance greater than 0
    # @broke = BankAccount.new("Kat Dennings"); @broke = self.new(name)
    # @broke.balance = 0; @broke.balance = 0
    # @closed = BankAccount.new("Beth Behrs") @closed = self.new(name)
    # @closed.status = "closed"; @closed.status = "closed"
    # expect(avi.valid?).to eq(true)
    # expect(@broke.valid?).to eq(false)
    # expect(@closed.valid?).to eq(false)
    if self.status == "open" && self.balance > 0
      true
    else self.status != "open" && self.balance <= 0
      false
    end
  end

  def close_account #can close its account
    # avi.close_account
    # expect(avi.status).to eq("closed")
    self.status = "closed"
  end

end
