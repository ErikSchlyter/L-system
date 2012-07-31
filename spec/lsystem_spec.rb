require 'LSystem'

describe "LSystem" do
  context "given axiom 'A'" do
    context "with function A=AA" do
      describe "#to_s" do
        it "should equal 'A' at zero iteration" do
          LSystem.new("A", {'A' => 'AA'}, 0).to_s.should == "A"
        end
        it "should equal 'AA' after one iteration" do
          LSystem.new("A", {'A' => 'AA'}, 1).to_s.should == "AA"
        end
        it "should equal 'AAAA' after two iterations" do
          LSystem.new("A", {'A' => 'AA'}, 2).to_s.should == "AAAA"
        end
      end
    end

    context "with functions A=AB and B=A" do
      describe "#to_s" do
        it "should equal 'AB' after one iteration" do
          LSystem.new("A", {'A' => 'AB', 'B' => 'A'}, 1).to_s.should == "AB"
        end
        it "should equal 'ABA' after two iterations" do
          LSystem.new("A", {'A' => 'AB', 'B' => 'A'}, 2).to_s.should == "ABA"
        end
        it "should equal 'ABAAB' after three iterations" do
          LSystem.new("A", {'A' => 'AB', 'B' => 'A'}, 3).to_s.should == "ABAAB"
        end
      end
    end

    context "and function A=ABA" do
      describe "#to_s" do
        it "should equal 'ABA' after one iteration" do
          LSystem.new("A", {'A' => 'ABA'}, 1).to_s.should == "ABA"
        end
        it "should equal 'ABABABA' after two iterations" do
          LSystem.new("A", {'A' => 'ABA'}, 2).to_s.should == "ABABABA"
        end
      end
    end
  end
  context "given axiom 'ABC'" do
    context "with function D=A" do
      describe "#to_s" do
        it "should equal 'ABC' at zero iterations" do
          LSystem.new("ABC", {'D' => 'A'}, 0).to_s.should == "ABC"
        end
        it "should equal 'ABC' after seven iterations" do
          LSystem.new("ABC", {'D' => 'A'}, 7).to_s.should == "ABC"
        end
      end
    end
  end
end
