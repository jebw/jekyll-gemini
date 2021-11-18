module JekyllGemini
  module Fixes
    module Destination
      def destination(*_args)
        super.gsub(%r{/index.html\z}, "/index#{output_ext}")
      end
    end
  end
end

Jekyll::Document.prepend JekyllGemini::Fixes::Destination
