class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  def home
    redirect_to("/mockup.html")
  end

  def rps

    @user_move = params["the_move"]

    @computer_move = ["rock", "paper", "scissors"].sample

    if @user_move == @computer_move
      @outcome = "tied"
    elsif @user_move == "paper" && @computer_move == "rock"
      @outcome = "won"
    elsif @user_move == "paper" && @computer_move == "scissors"
      @outcome = "lost"
    elsif @user_move == "scissors" && @computer_move == "rock"
      @outcome = "lost"
    elsif @user_move == "scissors" && @computer_move == "paper"
      @outcome = "won"
    elsif @user_move == "rock" && @computer_move == "paper"
      @outcome = "lost"
    elsif @user_move == "rock" && @computer_move == "scissors"
      @outcome = "won"
    end

    m = Move.new
    m.user_move = @user_move
    m.computer_move = @computer_move
    m.user_wins = if @outcome == "won"
      1
    else
      0
    end
    m.computer_wins = if @outcome == "lost"
      1
    else
      0
    end
    m.tie = if @outcome == "tied"
      1
    else
      0
    end
    m.save


    @rock_won = Move.where({ :user_move => "rock", :user_wins => 1 }).count
    @rock_lost = Move.where({ :user_move => "rock", :computer_wins => 1 }).count
    @rock_tied = Move.where({ :user_move => "rock", :tie => 1 }).count

    @paper_won = Move.where({ :user_move => "paper", :user_wins => 1 }).count
    @paper_lost = Move.where({ :user_move => "paper", :computer_wins => 1 }).count
    @paper_tied = Move.where({ :user_move => "paper", :tie => 1 }).count

    @scissors_won = Move.where({ :user_move => "scissors", :user_wins => 1 }).count
    @scissors_lost = Move.where({ :user_move => "scissors", :computer_wins => 1 }).count
    @scissors_tied = Move.where({ :user_move => "scissors", :tie => 1 }).count

    @move_list = Move.all
    @move_count = Move.all.count

    @ordered_move = Move.all.order(:id)

    @one = Move.order(:id)[0]
    @two = Move.order(:id)[1]
    @three = Move.order(:id)[2]
    @four = Move.order(:id)[3]
    @five = Move.order(:id)[4]
    @six = Move.order(:id)[5]
    @seven = Move.order(:id)[6]
    @eight = Move.order(:id)[7]
    @nine = Move.order(:id)[8]
    @ten = Move.order(:id)[9]
    @eleven = Move.order(:id)[10]









    render("move.html.erb")
  end
end
