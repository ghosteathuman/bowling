require "rails_helper"

RSpec.describe "Games", type: :request do
  describe "create" do
    it "will create new game" do
      post "/games"

      expect(response).to have_http_status(:created)
      expect(Game.count).to eq 1
    end
  end

  describe "show" do
    let(:game) { create(:game) }
    it "will show an existing game" do
      game = Game.create

      get "/games/#{game.id}"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("total_score")
      expect(response.body).to include("frame_score")
    end
  end

  describe "update" do
    it "will update existing game with valid number of pins" do
      game = Game.create
      put "/games/#{game.id}?pins=10"

      expect(response).to have_http_status(:ok)
      expect(game.total_score.value).to eq 10
      expect(game.frame_score.elements).to eq [10]
    end

    it "will update existing game with invalid number of pins" do
      game = Game.create
      put "/games/#{game.id}?pins=20"

      expect(response).to have_http_status(:bad_request)
      expect(response.body).to include("Pins must be between 0 to 10.")
    end
  end
end
