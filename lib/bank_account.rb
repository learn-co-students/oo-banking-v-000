class BankAccount

  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end

<<<<<<< HEAD
  def deposit(deposit)
    @balance += deposit
=======
  def deposit(deposit_amount)
    self.balance += deposit_amount
>>>>>>> 916cfd704a9d9bb65fefd80f2d2454ed0dbc000d
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
<<<<<<< HEAD
    @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end
end
=======
    self.balance > 0 && self.status == "open" ? true:false
    end

    def close_account
      self.status = "closed"
    end
end
>>>>>>> 916cfd704a9d9bb65fefd80f2d2454ed0dbc000d
