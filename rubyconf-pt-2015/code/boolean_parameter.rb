class Conference
  def initialize(name)
    @name = name
  end

  def ruby?(strict = true)
    if strict
      @name.include?('Ruby')
    else
      @name.include?('Ru')
    end
  end
end

p Conference.new('BaRuCo').ruby?
p Conference.new('BaRuCo').ruby?(false)

class Conference
  def surely_ruby?
    @name.include?('Ruby')
  end

  def possibly_ruby?
    @name.include?('Ru')
  end
end
