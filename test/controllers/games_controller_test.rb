require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  def setup
    GameStore.clear_all
  end
  
  test "should get index" do
    get games_url
    assert_response :success
    assert_select "h1", "Truth or Lie Games"
  end

  test "should get new" do
    get new_game_url
    assert_response :success
    assert_select "h1", "Create New Game"
  end

  test "should create game" do
    assert_difference('GameStore.all_games.count') do
      post games_url, params: { 
        game_session: { 
          candidate_name: "Test Candidate",
          candidate_photo: "https://example.com/photo.jpg",
          statements_attributes: [
            { content: "Statement 1", is_truth: true },
            { content: "Statement 2", is_truth: false },
            { content: "Statement 3", is_truth: true }
          ]
        }
      }
    end

    game = GameStore.all_games.last
    assert_redirected_to "/game/#{game.token}"
  end

  test "should show game" do
    # Create a game directly for testing
    game = GameStore.create_game(
      candidate_name: "Test Candidate",
      candidate_photo: "https://example.com/photo.jpg",
      statements_attributes: [
        { content: "Statement 1", is_truth: true },
        { content: "Statement 2", is_truth: false },
        { content: "Statement 3", is_truth: true }
      ]
    )
    
    get game_path(game)
    assert_response :success
    assert_select "h2", "Test Candidate"
  end
end
