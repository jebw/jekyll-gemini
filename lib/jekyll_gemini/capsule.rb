class JekyllGemini::Capsule < Jekyll::Site
  GEMTEXT_EXT = %w[.gmi .gmni .gemini]

  def setup
    super

    self.converters = [::JekyllGemini::Converter.new(config)]
    self.generators = []
  end

  def publisher
    @publisher ||= ::JekyllGemini::Publisher.new(self)
  end

  def static_files
    []
  end
end
