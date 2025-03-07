# extensions.rb
class Integer
  def ordinalize
    if (11..13).cover?(self % 100)
      "#{self}º"
    else
      case self % 10
      when 1 then "#{self}º"
      when 2 then "#{self}º"
      when 3 then "#{self}º"
      else "#{self}º"
      end
    end
  end
end