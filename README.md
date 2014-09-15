#Media UK Scraper
MediaUKScraper is a gem that makes it easy to scrape the Media UK directory.

The gem scrapes companies from the Media UK directory and allows you to individually grab a variety of there social statistics. 

#Getting Started

To get started you first need some search results to play with, to generate search results call search on the `MediaukScraper` method and pass it a string of what you want to search: 
	
	page = MediaukScraper.search("fashion")
	
#Getting company details

Once you've generated some search results you can view an array of the list of companies. To do this call 'companies' on your search results. 
	
	page = MediaukScraper.search("news")
	page.companies

*This will return an array of companies with each company containing the keys name, logo and url.*

###Returning Company Records: 

There are a number of ways you can get a single company record from your companies array:

	first_company = page.companies.first

Calling `.first` on your company list will return the first record in the array. 
	
	third_company = page.companies[2]

You can pass in a number value it's important to note that it's zero indexed so putting in `[3]` will give you the 4th record in the array.

#Company Helpers

There is a number of helpers available to extract different information out of your company:

###name

*Returns the companies name.*

	company = page.companies.first
	company.name
	
###logo

*Returns the companies logo image.*

	company = page.companies.first
	company.logo


###address

*Returns the companies address.*

	company = page.companies.first
	company.address
	
###phone

*Returns the companies phone number.*

	company = page.companies.first
	company.phone


###fb_website_likes

*Returns the number of times the companies website has been liked via Facebook.*

	company = page.companies.first
	company.fb_website_likes
	
###fb_website_shares

*Returns number of times the companies website has been shared on Facebook.*

	company = page.companies.first
	company.fb_website_shares
	
###fb_comments_on_shares

*Returns number of times people have commented on shared links of this company.*

	company = page.companies.first
	company.fb_comments_on_shares

###youtube_subscribers

*Returns the total Youtube subscriber count for the company.*

	company = page.companies.first
	company.youtube_subscribers

###youtube_video_views

*Returns the total number of video views the company has on youtube.*

	company = page.companies.first
	company.youtube_video_views

###google_plus_ones

*Returns how many times the company has been +1 on Google Plus.*

	company = page.companies.first
	company.google_plus_ones

###twitter_followers

*Returns the total number of Twitter followers for that company.*

	company = page.companies.first
	company.twitter_followers

###linkedin_shares

*Returns the number of times the company has been shared via Linkedin*

	company = page.companies.first
	company.linkedin_shares

