# frozen_string_literal: true

module JekyllGemini
  class Configuration
    CAPSULE_DEFAULTS = {
      'layouts_dir' => '_gemini_layouts',
      'destination' => File.join(Dir.pwd, '_capsule'),
      'theme' => nil
    }.freeze

    CAPSULE_DEFAULT_EXCLUDES = %w[css js fonts].freeze

    class << self
      def build(override)
        Jekyll.configuration(override)
              .tap(&method(:add_capsule_defaults))
              .tap(&method(:add_capsule_specific_keys))
              .tap(&method(:add_capsule_excludes))
      end

      private

      def add_capsule_defaults(config)
        config.merge!(CAPSULE_DEFAULTS)
      end

      def add_capsule_specific_keys(config)
        capsule_keys = (config['capsule'] || {}).dup
        capsule_keys.delete('exclude')

        config.merge!(capsule_keys)
      end

      def add_capsule_excludes(config)
        excludes = (config['capsule'] || {})['exclude']
        excludes ||= CAPSULE_DEFAULT_EXCLUDES

        config['exclude'] ||= []
        config['exclude'].concat(excludes).uniq!
      end
    end
  end
end
