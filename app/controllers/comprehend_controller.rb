require 'aws-sdk-comprehend'

class ComprehendController < ApplicationController
  def analyze_text
    # Configuração do cliente Comprehend
    comprehend = Aws::Comprehend::Client.new(region: 'us-east-2')

    # Parâmetros para o job de detecção de tópicos
    job_params = {
      input_data_config: {
        s3_uri: 's3://eduardoteste2/Documento sem título.txt', # URI do arquivo de texto a ser analisado
        input_format: 'ONE_DOC_PER_LINE' # Formato do arquivo de entrada (um documento por linha)
      },
      output_data_config: {
        s3_uri: 's3://eduardoteste2/output/891377055217-TOPICS-8ff77d846a46b382e1c6668a0393b242/output/output.tar.gz' # URI do local onde os resultados serão salvos
      },
      data_access_role_arn: 'arn:aws:iam::891377055217:role/service-role/AmazonComprehendServiceRole-eduardorosateste',
      job_name: 'eduardoteste4' # Nome do job
    }

    # Iniciar o job de detecção de tópicos
    response = comprehend.start_topics_detection_job(job_params)

    # Saída da chamada da API
    render json: response.to_h
  end
end
