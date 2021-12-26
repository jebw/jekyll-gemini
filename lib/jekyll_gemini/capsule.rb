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

  def render
    puts "CONVERTERS ARE #{self.converters.map(&:class).map(&:to_s).inspect}"

    super
  end

  # def setup
  #   ensure_not_in_dest

  #   plugin_manager.conscientious_require

  #   puts "I AM #{self.object_id}"

  #   self.converters = [JekyllGemini::Converter.new(config)]
  #   self.generators = []

  #   puts "CONVERTERS: #{self.converters.length}"
  # end

  # def render
  #   relative_permalinks_are_deprecated

  #   payload = site_payload

  #   Jekyll::Hooks.trigger :site, :pre_render, self, payload

  #   render_docs(payload)
    # render_pages(payload)

  #   Jekyll::Hooks.trigger :site, :post_render, self, payload
  #   nil
  # end

  def generate
    # FIXME: disabled for now
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
