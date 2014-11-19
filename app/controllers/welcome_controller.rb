class WelcomeController < ApplicationController

  require "rest_client"

  def search

    # here we would either hit the api directly like so: 
    
    # @response = RestClient.get "https://yoda.p.mashape.com/yoda?sentence=You+must+train+hard+to+improve+your+Ruby.", 
    # {"X-Mashape-Key" => "enter_your_mashape_key_here"}
    # puts @response

    #or kick off a background job to translate this text we got from the form in params[:search]

    # background_job_to_translate_text(params[:search])

    #we'll pretend a response looks like this:
    response = {response: [ {content: "some data" }, {content: 'this is your data'} ], code: 200}.to_json
    
    #we'll need to parse the json we get back so we can read it as a ruby hash
    stuff = JSON.parse(response)


    #traverse the hash like a set of nested hashes/arrays
    #this gets: "this is your data"
    #you can read this in your rails server logs
    puts stuff["response"][1]["content"]


    if stuff["code"] == 200

      #here you can iterate over the array stored in the ["response"] key with a loop
      stuff["response"].each do |data|

        #we can store each piece of data in the model with create, or new/save
        # sentence = Sentence.new(title: data["content"], code: stuff["code"])
        # sentence.save
      end
    else
      puts "hey we got an api error"
    end

  end

  def yoda
    # @response = RestClient.get "https://yoda.p.mashape.com/yoda?sentence=You+must+train+hard+to+improve+your+Ruby.", 
    # {"X-Mashape-Key" => "enter_your_mashape_key_here"}
    # puts @response
  end
  
  def index
  end

  def db_cache
    render plain: "stuff from our database"
  end

end