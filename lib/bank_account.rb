
class BankAccount
  attr_accessor  :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self

  end
  def all
    @@all
  end
  def name=(name)
    raise AssociationTypeMismatchError
    @name = name
  end

  def deposit(new_deposit)
    @balance += new_deposit
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?

    self.balance > 0 && self.status == "open"? true : false

  end

  def close_account
    self.status = "closed"
  end

end
