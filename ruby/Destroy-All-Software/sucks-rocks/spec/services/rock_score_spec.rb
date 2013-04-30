require_relative "../../app/services/rock_score"
require_relative "../../app/services/search_engine"

describe RockScore do
	it "returns 0 for unpopular terms" do
		SearchEngine.stub(:count_results).with("badscore rocks") { 0 }
		SearchEngine.stub(:count_results).with("badscore sucks") { 1 }
		RockScore.for_term("badscore").should == 0.0
	end
	
	it "returns 10 for popular terms" do
		SearchEngine.stub(:count_results).with("badscore rocks") { 1 }
		SearchEngine.stub(:count_results).with("badscore sucks") { 0 }
		RockScore.for_term("badscore").should == 10.0
	end
	
	it "returns mediocre score for mediocre terms" do
		SearchEngine.stub(:count_results).with("badscore rocks") { 9 }
		SearchEngine.stub(:count_results).with("badscore sucks") { 11 }
		RockScore.for_term("badscore").should == 4.5
	end
	
	it "does not divide by zero" do
		SearchEngine.stub(:count_results).with("badscore rocks") { 0 }
		SearchEngine.stub(:count_results).with("badscore sucks") { 0 }
		RockScore.for_term("badscore").should == RockScore::NoScore
	end
end