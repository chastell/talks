class Meetup
  def interesting?(attendee)
    case attendee
    when 'pythonista' then dynamic?
    when 'rubyist'    then laid_back?
    when 'rustacean'  then system?
    end
  end
end

p Meetup.new.interesting?('pythonista')
p Meetup.new.interesting?('rubyist')
p Meetup.new.interesting?('rustacean')

class Meetup
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
