module JekyllGemini
  class Configuration
    CAPSULE_DEFAULTS = {
      'layouts_dir' => '_gemini/_layouts',
      'destination' =>  File.join(Dir.pwd, '_capsule'),
      'theme' => nil,
    }

    class << self
      def build(override)
        Jekyll.configuration(override)
              .tap(&method(:add_capsule_defaults))
              .tap(&method(:add_capsule_specific_keys))
      end

    private

      def add_capsule_defaults(config)
        config.merge!(CAPSULE_DEFAULTS)
      end

      def add_capsule_specific_keys(config)
        config.merge!(config['capsule'] || {})
      end
    end
  end
end
