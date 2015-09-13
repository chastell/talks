class Conference
  def initialize(name = nil)
    @name = name
  end

  def camel_cased?
    !!@name.match(/\A([A-Z][a-z])+\z/) unless @name.nil?
  end
end

p Conference.new('RubyConf PT').camel_cased?
p Conference.new('EuRuKo').camel_cased?
p Conference.new.camel_cased?

class Conference
  def self.new(name = nil)
    name ? super : UnnamedConference.new
  end

  def initialize(name)
    @name = name
  end

  def camel_cased?
    !!@name.match(/\A([A-Z][a-z])+\z/)
  end
end

class UnnamedConference
  def camel_cased?
    false
  end
end

p Conference.new('RubyConf PT').camel_cased?
p Conference.new('EuRuKo').camel_cased?
p Conference.new.camel_cased?
