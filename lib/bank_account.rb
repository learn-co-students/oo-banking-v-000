class BankAccount

attr_accessor :name

attr_writer :balance, :status

  def initialize(name)
    @name = name
    @balance = $1000
    @status = open
  end

end
