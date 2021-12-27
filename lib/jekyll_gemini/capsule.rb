class JekyllGemini::Capsule < Jekyll::Site
  GEMTEXT_EXT = %w[.gmi .gmni .gemini]
  CONFIG_OVERRIDES = {
    'layouts_dir' => '_gemini/_layouts',
    'destination' => '_capsule',
    'theme' => nil
  }

  def config
    super.merge(CONFIG_OVERRIDES)
  end

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
