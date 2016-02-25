class Meetup
  def initialize(languages)
    @languages = languages
  end

  def ruby?(strict = true)
    if strict
      @languages == ['Ruby']
    else
      @languages.include?('Ru')
    end
  end
end

p Meetup.new(%(Ruby Crystal)).ruby?
p Meetup.new(%(Ruby Crystal)).ruby?(false)

class Meetup
  def surely_ruby?
    @languages == ['Ruby']
  end

  def possibly_ruby?
    @languages.include?('Ru')
  end
end
