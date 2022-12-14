# file: spec/integration/app_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so that we can use rack-test helper methods
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  let(:app) {Application.new}

  context "GET to /names" do
    it "returns 200 with the right content" do
      # Send a get request to /names
      # and returns a response we can test
      response = get("/names")

      # Assert the response status code and body
      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "POST to /sort-names with query params" do
    it "returns 200 with names sorted" do
      # Send a get request to /sort-names
      # and returns a response we can test
      response = post("/sort-names?names=Joe,Alice,Zoe,Julia,Kieran")

      # Assert the response status code and body
      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
    it "returns 200 with names sorted" do
      # Send a get request to /sort-names
      # and returns a response we can test
      response = post("/sort-names?names=Zebedee,Alex,Tom,Karen,Jennie")
  
      # Assert the response status code and body
      expect(response.status).to eq(200)
      expect(response.body).to eq("Alex,Jennie,Karen,Tom,Zebedee")
    end  
  end

  context "POST to /sort-names with body params" do
    it "returns 200 with names sorted" do
      # Send a get request to /sort-names
      # and returns a response we can test
      response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")

      # Assert the response status code and body
      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
    it "returns 200 with names sorted" do
      # Send a get request to /sort-names
      # and returns a response we can test
      response = post("/sort-names", names: "Zebedee,Alex,Tom,Karen,Jennie")
  
      # Assert the response status code and body
      expect(response.status).to eq(200)
      expect(response.body).to eq("Alex,Jennie,Karen,Tom,Zebedee")
    end  
  end

end
