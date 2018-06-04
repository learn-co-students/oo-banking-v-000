class BankAccount

attr_accessor :name

attr_reader :balance, :status

  def initialize(name)
    @name = name
    @balance = $1000
    @status = open
  end

end
