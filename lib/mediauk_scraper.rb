require "mediauk_scraper/version"
require "mechanize"

module MediaukScraper

  class Page

    def initialize(mech_page)
      @mech_page = mech_page
    end

    def companies
      extract_companies unless @companies
      @companies
    end

  private

    def extract_companies
      @companies = []
      links = @mech_page.search("//div[@class='inner']/div/div/a")
      links.each do |link|
        name = link.text
        path = link["href"]
        images = link.search('img')
        logo = if images.empty?
          "http://www.sylvain-lader.fr/wp-content/uploads/2012/07/placeholder.jpg"
        else
          images.first['src'] 
        end
        @companies << Company.new(name, path, logo)
      end
    end

  end

  class Company

    attr_accessor :name, :url, :logo

    def initialize(name, path, logo)
      @name = name
      @url  = "http://www.mediauk.com/" + path[1..-1]
      @logo = logo
      @socialurl = "http://www.mediauk.com/" + path[1..-1] + "/social-media"
    end

    def mech_page
      @mech_page ||= Mechanize.new.get(@url)
    end

    def social_mech_page
      @social_mech_page ||= Mechanize.new.get(@socialurl)
    end

    def address
      mech_page.search("//div[@class='street-address']").search('span').text
    end

    def phone
      phonenumber = mech_page.link_with(:class => "PhoneLink")
      number = if phonenumber.nil?
          nil
        else
          mech_page.link_with(:class => "PhoneLink").text 
        end
    end

    #social score

    def social_score

    end

    #how many times the websites been liked

    def fb_website_likes
      fb_likes = social_mech_page.search("//div[@class='inner']").search("dt")[0]
      fb_website_likes = if fb_likes.nil?
        nil
      else
        social_mech_page.search("//div[@class='inner']").search("dt")[0].text
      end
    end

    #how many times the websites been shared on facebook

    def fb_website_shares 
      social_mech_page.search("//div[@class='inner']").search("dt")[1].text
    end

    #comments made on shared links

    def fb_comments_on_shares 
      social_mech_page.search("//div[@class='inner']").search("dt")[2].text
    end

    def youtube_subscribers
      stat_label = social_mech_page.search('//dd[contains(text(), "subscribers to ")]')
      channel_subscribers = stat_label.search('../dt').text
      channel_subscribers
    end

    def youtube_video_views
      stat_label = social_mech_page.search('//dd[contains(text(), "total video views on YouTube")]')
      video_views = stat_label.search('../dt').text
      video_views
    end

    def google_plus_ones
      stat_label = social_mech_page.search('//dd[contains(text(), "+1s on ")]')
      plus_ones = stat_label.search('../dt').text
      plus_ones
    end

    def twitter_followers
      stat_label = social_mech_page.search('//dd[contains(text(), "Twitter followers to @")]')
      twitter_followers = stat_label.search('../dt').text
      twitter_followers
    end

    def linkedin_shares
      stat_label = social_mech_page.search('//dd[contains(text(), "shares on ")]')
      linkedin_shares = stat_label.search('../dt').text
      linkedin_shares
    end

  
  end

  
  def self.search(search_term=nil)
    agent = Mechanize.new
    mech_page = agent.get("http://www.mediauk.com/")
    mediauk_form = agent.page.forms[0]
    mediauk_form.keyword = search_term
    Page.new agent.submit(mediauk_form, mediauk_form.buttons.first)
  end


end
