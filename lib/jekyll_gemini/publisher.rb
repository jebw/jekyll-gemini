module JekyllGemini
  class Publisher < ::Jekyll::Publisher
    GEMTEXT_EXT = %w[.gmi .gmni .gemini]

    def publish?(item)
      super && is_gemtext?(item)
    end

  private

    def is_gemtext?(file)
      puts "CHECKING COMPATIBILITY OF #{file.path}"
      GEMTEXT_EXT.include?(file.extname)
    end
  end
end
