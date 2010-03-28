require "open-uri"

class News
  attr_accessor :uri
    
  def source_data
    @source_data = ""
    if uri
      open(uri) do |f|
        @source_data = f.read
      end
    end
    @source_data
  end
  
  def top_story
    match = source_data.match(%r{<h4>Latest news<\/h4>.*?<li><a href="(.*?)">(.*?)<\/a>})
    {:url => match[1], :title => match[2].strip}
  end

end