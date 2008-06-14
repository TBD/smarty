
require "test/unit"
require "yaml"
require '../../clasifyutil/cclassifier.rb'
include CClassifier

class TestClassifier < Test::Unit::TestCase
  
  def test_classifier_01
    test_file = File.open('./test_files/classify01.yml',"r")
    test_content = YAML::load(test_file)
   
    cc = ContentClassifier.new    
    test_content.each {
      |k,v|
      puts "Adding category #{k.to_s}"
      cc.add_category k
    }    
    
    test_content.each {
      |k,v|
      v.each { 
        |k1,v1| 
        puts "Training category: #{k.to_s} with item: #{v1.to_s}"
        cc.train(k,v1)}
    }  
    
    res1 = cc.classify("bamby")
    res2 = cc.classify("etica biblie")
    res3 = cc.classify("haine spalati calcati etica biblie")
    
    assert_equal("Music content",res1)
    assert_equal("Personal content", res2)
    assert_equal("Friends content", res3)
  end
end