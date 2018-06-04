class BankAccount

attr_accessor :name

attr_writer :balance, :status

  def initialize(status = open)
    @balance = $1000
    @status = status
  end

end
