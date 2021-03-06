module Money
  class Dollar
    attr_reader :amount
    def initialize(amount)
      @amount = amount
    end

    def times(multiplier)
      self.class.new(amount * multiplier)
    end

    def equals(object) 
      dollar = object
      amount == dollar.amount
    end
  end
end

