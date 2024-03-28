class ComprehendController < ApplicationController
  require 'aws-sdk-comprehend'

  def analyze_text
    text = "Eduardo esta muito triste"

    response = COMPREHEND_CLIENT.detect_sentiment({
      text: text,
      language_code: "pt"
    })

    puts "Sentimento: #{response.sentiment}"
    puts "Pontuação: #{response.sentiment_score}"

    render json: response.sentiment_score
  end
end
