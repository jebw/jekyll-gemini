# frozen_string_literal: true

module JekyllGemini
  class Capsule < Jekyll::Site
    def setup
      super

      self.converters = [Converter.new(config)]
      self.generators = []
    end

    def publisher
      @publisher ||= Publisher.new(self)
    end
  end
end
