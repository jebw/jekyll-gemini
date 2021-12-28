module JekyllGemini
  module Fixes
    module Destination
      def destination(*_args)
        super.gsub(%r{/index.html\z}, "/index#{output_ext}")
      end
    end

    module Publisher
      def publisher
        @publisher ||= ::JekyllGemini::Publisher.new(self)
      end
    end
  end
end

Jekyll::Document.prepend JekyllGemini::Fixes::Destination
Jekyll::Site.prepend JekyllGemini::Fixes::Publisher
