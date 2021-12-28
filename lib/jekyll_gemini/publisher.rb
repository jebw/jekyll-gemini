# frozen_string_literal: true

module JekyllGemini
  class Publisher < ::Jekyll::Publisher
    def publish?(item)
      super && compatible_with_site?(item) && targetted_at_site?(item)
    end

    private

    def compatible_with_site?(item)
      @site.is_a?(Capsule) ? gemtext?(item) : true
    end

    def gemtext?(item)
      Converter::GEMTEXT_EXT.include?(item.extname)
    end

    def targetted_at_site?(item)
      case item.data.fetch('target', nil)
      when 'capsule' then @site.is_a?(Capsule)
      when 'site' then !@site.is_a?(Capsule)
      else true
      end
    end
  end
end
