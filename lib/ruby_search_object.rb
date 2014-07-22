require "ruby_search_object/version"

module RubySearchObject
  module ClassMethods
    def search(params = {})
      search_handler(params).search
    end

    def search_handler params = {}
      search_handler = search_handler_class.new(params)
    end

    def search_handler_class
      Object.const_get("#{name}Search")
    end
  end

  def self.included(host_class)
    host_class.extend ClassMethods
  end
end