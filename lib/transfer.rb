require 'pry'
class Transfer
  # your code here
  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  # def execute_transaction
  #   #binding.pry
  #   if @sender.balance < @amount
  #     #binding.pry
  #     return "Transaction rejected. Please check your account balance."
  #   else @sender.balance > @amount
  #     #binding.pry
  #     @status = "complete"
  #     @sender.balance -= @amount
  #     @receiver.balance += @amount
  #   end
  # end

  def execute_transaction
    if @sender.valid? && @sender.balance > @amount && @status == "pending" && @receiver.valid?
      #binding.pry
        @sender.balance -= @amount
        @receiver.deposit(@amount)
        @status = "complete"
    else #@sender.balance < @amount || @sender.valid? == false || @status != "pending"
      #binding.pry
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    # @sender = receiver
    # @receiver = sender
    # execute_transaction

    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
