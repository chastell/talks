class Conference
  def interesting?(attendee)
    case attendee
    when 'pythonista' then dynamic?
    when 'rubyist'    then laid_back?
    when 'rustacean'  then system?
    end
  end
end

p Conference.new.interesting?('pythonista')
p Conference.new.interesting?('rubyist')
p Conference.new.interesting?('rustacean')

class Conference
  def interesting_to_pythonistas?
    dynamic?
  end

  def interesting_to_rubyists?
    laid_back?
  end

  def interesting_to_rustaceans?
    system?
  end
end
