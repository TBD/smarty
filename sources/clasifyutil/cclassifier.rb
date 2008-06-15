require 'stemmer'
require 'classifier'
include Classifier

#todo: refactor the usage; still not easy to use;
#todo: refactor: add a repository for the training samples and for the categories; !!for each user in part it should have a different repository

module CClassifier
  class ContentClassifier
    
    def initialize
      @classifier = Bayes.new 
    end
    
    def add_category(category_name)
      @classifier.add_category category_name
    end
    
    #trains a new category
    def train(category_name, item)      
      @classifier.train category_name, item
    end
    
    def classify(content)
      @classifier.classify content
    end
  end
end

