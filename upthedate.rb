class UTDMonthDay
  def initialize(day, month)
    @day = day; @month = month.new.to_i
  end

  def /(year)
    DateTime.new(year, @month, @day)
  end
end

class Fixnum
  alias_method :old_minus, :/
  def /(n)
    if n.respond_to?(:superclass) && n.superclass == UTDMonth
      UTDMonthDay.new(self, n)
    else
      old_minus n
    end
  end
end

class UTDMonth
end

class Jan < UTDMonth
  def to_i; 1; end
end

class Feb < UTDMonth
  def to_i; 2; end
end

class May < UTDMonth
  def to_i; 5; end
end

