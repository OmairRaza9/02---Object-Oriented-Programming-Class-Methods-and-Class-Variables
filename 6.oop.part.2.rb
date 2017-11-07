class BankAccount
  @@interest_rate = 1.01
  @@acounts = []

  def initialize
    @balance = 0
  end


  def balance
    @balance = balance

  end

  def deposit(number)
    @balance += number
  end

  def withdraw(number)
    @balance -= number
  end

  def interest_time
    @@acounts.each do |interest|
      @balance *= @@interest_rate
    end
  end
end
