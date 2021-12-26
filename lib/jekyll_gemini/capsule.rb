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

    self.converters = [JekyllGemini::Converter.new(config)]
    self.generators = []
  end

  def docs_to_write
    super.select(&method(:is_gemtext?))
  end

  def pages
    super.select(&method(:is_gemtext?))
  end

  def static_files
    []
  end

  private

  def is_gemtext?(file)
    GEMTEXT_EXT.include?(file.extname)
  end

  def render_docs(payload)
    collections.each_value do |collection|
      collection.docs.select(&method(:is_gemtext?)).each do |document|
        render_regenerated(document, payload)
      end
    end
  end
end
