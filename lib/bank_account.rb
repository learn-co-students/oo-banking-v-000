class BankAccount
  attr_accessor :balance, :status
  @@all = []
  
  def save_account
    @@all << self
  end
  
  def initialize(name)
    @name = name
    @balance = 1000.00
    @status = "open"
  end
  
  def initiate_transfer(receiver, amount)
    receiver = self.find_or_create_by_name(receiver)
    Transfer.new(self, receiver, amount)
  end
  
  def self.find_or_create_by_name(account_name)
    if @@all.detect {|i| i.name == account_name}
      @@all.detect {|i| i.name == account_name}
    else
      new_account = self.new(account_name)
      new_account.save
      new_account
    end
  end
  
  def deposit(amount)
    @balance += amount.to_f
    @balance
  end
  
  def name
    @name
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    @status == "open" && @balance > 0
  end
    
  def close_account
    @status = "closed"
  end
  
end
