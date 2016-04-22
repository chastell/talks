class Conference
  def initialize(languages)
    @languages = languages
  end

  def ruby?(strict = true)
    if strict
      @languages == ['Ruby']
    else
      @languages.include?('Ruby')
    end
  end
end

p Conference.new(%(Ruby Crystal)).ruby?
p Conference.new(%(Ruby Crystal)).ruby?(false)

class Conference
  def surely_ruby?
    @languages == ['Ruby']
  end

  def possibly_ruby?
    @languages.include?('Ruby')
  end
end
