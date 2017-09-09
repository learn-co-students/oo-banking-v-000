class BankAccount

  attr_accessor :sender, :receiver

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def balance
    @balance = 1000
  end

  def status
    @status = "open"
  end

  def deposit #can deposit money into its acct
    @deposit
  end

  def display_balance #can display its balance
    "Your balance is $1000."
  end

  def valid? #is valid w/open status & balance > than 0 & != closed
    if @status == "open" and @balance >= 0
      valid
      else
        false
      end
    end

    def close_account
      @status = "closed"
    end


end
