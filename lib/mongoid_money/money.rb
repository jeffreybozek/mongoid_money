class Money < Numeric
  extend Mongoid::Extensions::Money::Conversions
  include Comparable

  attr_reader :cents

  def self.new_from_dollars(value)
    case value
      when Fixnum
        Money.new(value * 100)
      when BigDecimal
        Money.new((value * 100).fix)
      when Float
        Money.new((BigDecimal.new(value.to_s) * 100).fix)
      when Numeric
        Money.new((BigDecimal.new(value.to_s) * 100).fix)
      when String
        Money.new((BigDecimal.new(value.to_s) * 100).fix)
      else
        raise ArgumentError, "#{value} must be a numeric object or a string representation of a number."
    end
  end

  def self.new_from_cents(cents)
    Money.new cents.round.to_i
  end

  def initialize(cents)
    @cents = cents.round.to_i
  end

  def dollars
    (BigDecimal.new(cents.to_s) / 100 ).to_f
  end

  def ==(other_money)
    if other_money.respond_to?(:to_money)
      other_money = other_money.to_money
      cents == other_money.cents
    else
      false
    end
  end

  def eql?(other_money)
    self == other_money
  end

  def hash
    cents.hash
  end

  def <=>(other_money)
    if other_money.respond_to?(:to_money)
      other_money = other_money.to_money
      cents <=> other_money.cents
    else
      raise ArgumentError, "Comparison of #{self.class} with #{other_money.inspect} failed"
    end
  end

  def +(other_money)
    Money.new(cents + other_money.cents)
  end

  def -(other_money)
    Money.new(cents - other_money.cents)
  end

  def *(value)
    if value.is_a?(Money)
      raise ArgumentError, "Can't multiply a Money by a Money"
    else
      Money.new(cents * value)
    end
  end

  def /(value)
    if value.is_a?(Money)
      (cents / BigDecimal.new(value.cents.to_s)).to_f
    else
      Money.new(cents / value)
    end
  end

  def div(value)
    self / value
  end

  def divmod(val)
    if val.is_a?(Money)
      a = self.cents
      b = val.cents
      q, m = a.divmod(b)
      return [q, Money.new(m)]
    else
      return [self.div(val), Money.new(self.cents.modulo(val))]
    end
  end

  def modulo(val)
    self.divmod(val)[1]
  end

  def %(val)
    self.modulo(val)
  end

  def remainder(val)
    a, b = self, val

    a_sign, b_sign = :pos, :pos
    a_sign = :neg if a.cents < 0
    b_sign = :neg if (b.is_a?(Money) and b.cents < 0) or (b < 0)

    return a.modulo(b) if a_sign == b_sign
    a.modulo(b) - (b.is_a?(Money) ? b : Money.new(b))
  end

  def abs
    Money.new(self.cents.abs)
  end

  def zero?
    cents == 0
  end

  def nonzero?
    cents != 0 ? self : nil
  end

  def to_money
    self
  end

  def inspect
    to_s
  end

  def odd?
    @cents%2 > 0
  end

  def even?
    @cents%2 == 0
  end

  def to_s
    dollars.to_s
  end

  def to_f
    dollars
  end

  def coerce(other)
    return other, to_f
  end

  # Converts an object of this instance into a database friendly value.
  def mongoize
    cents
  end

  class << self

    # Get the object as it was stored in the database, and instantiate
    # this custom class from it.
    def demongoize(object)
      Money.new(object)
    end

    # Takes any possible object and converts it to how it would be
    # stored in the database.
    def mongoize(object)
      case object
      when Money then object.mongoize
      when Hash then Point.new(object[:x], object[:y]).mongoize
      else object
      end
    end

    # Converts the object that was supplied to a criteria and converts it
    # into a database friendly form.
    def evolve(object)
      case object
      when Money then object.mongoize
      when Fixnum then Money.new(value * 100)
      when BigDecimal then Money.new((value * 100).fix)
      when Float then Money.new((BigDecimal.new(value.to_s) * 100).fix)
      when Numeric then Money.new((BigDecimal.new(value.to_s) * 100).fix)
      when String then Money.new((BigDecimal.new(value.to_s) * 100).fix)
      else
        raise ArgumentError, "#{value} must be a numeric object or a string representation of a number."
      end
    end
  end

end

class Numeric

  def dollar
    dollars
  end

  def dollars
    Money.new_from_dollars self
  end

  def cent
    cents
  end

  def cents
    Money.new_from_cents self
  end

end
