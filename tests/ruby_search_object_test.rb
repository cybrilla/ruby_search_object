require 'minitest/spec'
require 'minitest/autorun'

$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'ruby_search_object'

class Article
  extend RubySearchObject::Helpers
end

class ArticleSearch
  attr_accessor :params
  def initialize params = {}
    @params = params
  end

  def search
    params
  end
end

describe RubySearchObject do

  describe 'when asked for search handler' do
    it 'returns the correct class' do
      Article.search_handler_class.must_equal ArticleSearch
    end
  end

  describe 'when asked for search handler' do
    it 'returns search handler instance of search handler' do
      Article.search_handler.class.must_equal ArticleSearch
    end
  end

  describe 'when asked to search' do
    it 'triggers the search on the object' do
      params = { param: 1 }
      Article.search(params).must_equal params
    end
  end
end