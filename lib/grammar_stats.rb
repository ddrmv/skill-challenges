require 'verify_text_start_end'

class GrammarStats
  def initialize
    @tested = 0
    @passed = 0
  end

  def check(text)
    check = verify_text_start_end(text)
    @tested += 1
    @passed += 1 if check
    return check
  end

  def percentage_good
    if @tested == 0
      raise "No checks yet."
    else
      percentage_successful = (@passed / @tested.to_f) * 100
      return percentage_successful.to_i
    end
  end
end