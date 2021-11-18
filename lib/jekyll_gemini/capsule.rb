class JekyllGemini::Capsule < Jekyll::Site
  GEMTEXT_EXT = %w[.gmi .gmni .gemini]
  CONFIG_OVERRIDES = {
    'layouts_dir' => '_gemini/_layouts',
    'destination' => '_capsule',
    'theme' => nil
  }

  # def each_site_file(&block)
  #   pages.each(&block)
  #   docs_to_write.each(&block)
  # end

  def config
    super.merge(CONFIG_OVERRIDES)
  end

  def static_files
    []
  end

  def pages
    return @pages if @pages.length < 1

    puts "STARTED WITH #{@pages.map(&:path).inspect}"

    @pages.select(&method(:is_gemtext_file?))
  end

  def setup
    super

    self.converters = [JekyllGemini::Converter.new(config)]
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

  def is_gemtext_file?(file)
    GEMTEXT_EXT.include?(file.extname)
  end
end
