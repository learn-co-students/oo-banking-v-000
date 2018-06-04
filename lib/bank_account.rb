class BankAccount

attr_accessor :name

attr_writer :balance, :status

  def initialize(name, status = open)
    @name = name
    @balance = $1000
    @status = status
  end

end
