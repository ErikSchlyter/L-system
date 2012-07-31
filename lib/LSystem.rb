
class LSystem
  def initialize(axiom, rules, iterations)
    @axiom = axiom
    @rules = rules
    @iterations = iterations
  end

  def expand(string, iterations, &block)
    string.each_char do |token|
      if @rules.has_key?(token) and iterations > 0 then
        expand(@rules[token], iterations - 1, &block)
      else
        yield token
      end
    end
  end

  def each
    expand(@axiom, @iterations) {|token| yield token }
  end

  def to_s
    output = ''
    each { |token| output << token }
    output
  end

end
