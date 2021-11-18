class JekyllGemini::Converter
  def initialize(_config); end

  def matches(ext)
    %w[.gemini .gmni .gmi].include?(ext)
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
