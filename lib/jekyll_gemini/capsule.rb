# frozen_string_literal: true

class JekyllGemini::Capsule < Jekyll::Site
  def setup
    super

    self.converters = [::JekyllGemini::Converter.new(config)]
    self.generators = []
  end

  def publisher
    @publisher ||= ::JekyllGemini::Publisher.new(self)
  end
end
