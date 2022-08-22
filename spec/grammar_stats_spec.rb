require 'grammar_stats'

RSpec.describe GrammarStats do
  context "initially" do
    it ".percentage_good raises an error" do
      grammar_stats = GrammarStats.new()
      expect { grammar_stats.percentage_good }.to raise_error "No checks yet."
    end
  end

  it ".check returns true for 'Starts upper, ends with dot.'" do
    grammar_stats = GrammarStats.new()
    expect(grammar_stats.check("Starts upper, ends with dot.")).to eq true
  end
  
  it ".check returns true for 'starts lower, ends with dot.'" do
    grammar_stats = GrammarStats.new()
    expect(grammar_stats.check("starts upper, ends with dot.")).to eq false
  end

  it ".check returns true for 'Starts upper, ends ungrammatically'" do
    grammar_stats = GrammarStats.new()
    expect(grammar_stats.check("Starts upper, ends ungrammatically")).to eq false
  end

  context "after five positive checks" do
    it ".percentage_good returns 100" do
      grammar_stats = GrammarStats.new()
      grammar_stats.check("Starts upper, ends with dot 1.")
      grammar_stats.check("Starts upper, ends with dot 2.")
      grammar_stats.check("Starts upper, ends with dot 3.")
      grammar_stats.check("Starts upper, ends with dot 4.")
      grammar_stats.check("Starts upper, ends with dot 5.")
      expect(grammar_stats.percentage_good).to eq 100
    end

    it ".percentage_good returns 60 after further 3 negative checks" do
      grammar_stats = GrammarStats.new()
      grammar_stats.check("Starts upper, ends with dot 1.")
      grammar_stats.check("Starts upper, ends with dot 2.")
      grammar_stats.check("Starts upper, ends with dot 3.")
      grammar_stats.check("Starts upper, ends with dot 4.")
      grammar_stats.check("Starts upper, ends with dot 5.")
      grammar_stats.check("Starts upper, ends with dot 1")
      grammar_stats.check("Starts upper, ends with dot 2")
      grammar_stats.check("Starts upper, ends with dot 3")
      expect(grammar_stats.percentage_good).to eq 62
    end
  end

end