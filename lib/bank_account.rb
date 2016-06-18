
class BankAccount
  attr_accessor  :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all = [@name, @balance, @status]
binding.pry
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
    if @balance > 0 && @status == "open"
      return true

    else
      return false
    end
  end

  def close_account
    self.status = "closed"
  end

end
