require "ruby_search_object/version"

module RubySearchObject
  module Helpers
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
end