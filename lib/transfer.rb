class Transfer
  # code here
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
   sender.valid? && receiver.valid?
 end

  def execute_transaction
   if self.status == "complete"
     return
   elsif self.amount >= self.sender.balance
     self.status = "rejected"
     return "Transaction rejected. Please check your account balance."
   else
     self.sender.balance -= self.amount
     self.receiver.balance += self.amount
     self.status = "complete"
   end
 end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount )
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end


end
