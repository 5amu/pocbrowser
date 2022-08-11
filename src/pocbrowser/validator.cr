require "./scrapers/dispach.cr"

module Pocbrowser
  class Validator
    def is_valid_cve(cve : String)
      /[cC][vV][eE]-\d{4,4}-\d{4,6}$/.match(cve)
    end

    def is_valid_mode(mode : String)
      ALLOWED_MODES.includes?(mode)
    end

    def is_valid_file(fname : String)
      File.file?(fname)
    end
  end
end
