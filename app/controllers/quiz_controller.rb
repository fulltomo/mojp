class QuizController < ApplicationController
  before_action :ensure_quiz_started, only: [ :question, :submit_answer, :result ]

  def start
    @questions = Question.order("RANDOM()").limit(10)
    session[:quiz_questions] = @questions.pluck(:id)
    session[:start_time] = Time.now
    session[:quiz_answers] = []
    session[:quiz_started] = true  # クイズ開始フラグをセット
  end

  def question
    @question_ids = session[:quiz_questions]
    @current_question_index = params[:question_index].to_i
    @question = Question.find(@question_ids[@current_question_index])
  end

  def submit_answer
    @question_ids = session[:quiz_questions]
    @current_question_index = params[:question_index].to_i
    session[:quiz_answers][@current_question_index] = params[:answer]

    if @current_question_index < @question_ids.length - 1
      next_question = quiz_question_path(question_index: @current_question_index + 1)
    else
      end_time = Time.now
      session[:quiz_time] = (end_time - Time.parse(session[:start_time])).round(2)
      next_question = quiz_result_path
    end

    render json: { next_question: next_question }
  end

  def result
    @questions = Question.where(id: session[:quiz_questions]).index_by(&:id)
    @questions = session[:quiz_questions].map { |id| @questions[id] }
    @answers = session[:quiz_answers]
    @time_taken = session[:quiz_time]
    @score = calculate_score(@questions, @answers, @time_taken)
  end

  private

  def calculate_score(questions, answers, time_taken)
    correct_count = questions.zip(answers).count { |q, a| q.correct.downcase == a.to_s.downcase }
    (correct_count * (1000 / time_taken)).floor
  end

  def ensure_quiz_started
    unless session[:quiz_started]  # クイズが開始されていない場合
      redirect_to root_path, alert: "You must start the quiz first."
    end
  end
end
