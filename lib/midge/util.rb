module Midge
  module Util
    protected

    def indent(string)
      string.gsub(/$(.)/m, "\\1  ").strip
    end

  end
end
