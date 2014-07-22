# RubySearchObject

This gem provides a layout for implementation of search on activerecord / sequel or any other ORM based models. What this gem does is it creates and instace of the search handler class for the model and invokes the search method on that class.

## Installation

Add this line to your application's Gemfile:

    gem 'ruby_search_object'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_search_object

Then include in you class like:
    
    class Article < ActiveRecord::Base
      include RubySearchObject
    end

If not using in rails you might have to load the gem using

    require 'ruby_search_object'


## Usage
Lets take the classic example of a **Article** search in an rails application.
When you include the `RubySearchObject` module adds a method called `search` to the class. Then you can pass the parameters to the search method which will then be passed to you search handler object and return the results. Every time you call the method search on the Article class a new search object is created. The search method creates a new instance of class `ArticleSearch` when included in class `Article`. So it appends `Search` to the class name so your search logic should go into the class named `ArticleSearch` or what ever the class name you are using + Search.


Example Implementaion of search.
Lets say each `Article` has a title, description and published date.

The Article Class will be like above

    class Article < ActiveRecord::Base
      include RubySearchObject
    end

An example article search class would be like (prefarably placed in app/services or app/search_handlers folder) 

    class ArticleSearch
      def initialize params = {}
        @title = params[:title]
        @start_date = params[:start_date]
        @end_date = params[:end_date]
        @articles = Article.order('id asc')
      end

      def search
        build_title_query
        build_date_range_query
        @articles
      end

      def build_title_query
        @articles = @articles.where(title: @title) if @title.present?
      end

      def build_date_range_query
        @articles = @articles.where('published_date >= ?', @start_date) if @start_date.present?
        @articles = @articles.where('published_date <= ?', @end_date) if @end_date.present?
      end
    end

Then you can call the search like

    Article.search(title: 'A Title', start_date: '2014-10-1', end_date: '2014-10-31')

which will instantiate the ArticleSearch class with above params and returns the search results after forumulating the sql query with conditions.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
