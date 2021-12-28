# frozen_string_literal: true

module JekyllGemini
  class Converter
    GEMTEXT_EXT = %w[.gmi .gmni .gemini].freeze

    def initialize(_config); end

    def matches(ext)
      GEMTEXT_EXT.include?(ext)
    end

    def output_ext(_ext)
      '.gmi'
    end

    # Passthrough without conversion
    def convert(content)
      content
    end

    def highlighter_prefix; end
    def highlighter_suffix; end
  end
end
