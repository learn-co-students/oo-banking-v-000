class BankAccount
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
    # binding.pry
  end

  def balance
    @balance
  end

  def status
    @status
  end

end
