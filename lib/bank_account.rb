class BankAccount
  #BankAccount BankAccount #initialize can initialize a Bank Account
     #Failure/Error: let(:avi) { BankAccount.new("Avi") }
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  #1) BankAccount #deposit can deposit money into its account
     #Failure/Error: avi.deposit(1000)

  def deposit(amount)
    @balance += amount
  end

  #1) BankAccount #display_balance can display its balance
     #Failure/Error: expect(avi.display_balance).to eq("Your balance is $#{avi.balance}.")
  def display_balance
    "Your balance is $#{@balance}."
  end

  #1) BankAccount #valid? is valid with an open status and a balance greater than 0
     #Failure/Error: expect(avi.valid?).to eq(true)
  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end
  #BankAccount #close_account can close its account
     #Failure/Error: avi.close_account
  def close_account
    @status = "closed"
  end
end
