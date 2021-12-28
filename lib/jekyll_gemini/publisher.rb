module JekyllGemini
  class Publisher < ::Jekyll::Publisher
    GEMTEXT_EXT = %w[.gmi .gmni .gemini]

    def publish?(item)
      super && compatible_with_site?(item) && targetted_at_site?(item)
    end

  private

    def compatible_with_site?(item)
      @site.is_a?(Capsule) ? is_gemtext?(item) : true
    end

    def is_gemtext?(item)
      GEMTEXT_EXT.include?(item.extname)
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
