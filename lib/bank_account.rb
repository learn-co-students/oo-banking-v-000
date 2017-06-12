require 'pry'
class BankAccount
  attr_accessor :name, :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def status=(change_status)
    @status = change_status
  end

  def name=(new_name)
    raise ChangeNameError if new_name != name
    @name = new_name
  end

  def deposit(integer)
    @balance+= integer
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = 'closed'
  end

end
