module Textract
  class Analyze < Service
    let(:client) { Aws::Textract::Client.new }
    def call
      resp = Aws::Textract::Client.new.start_document_analysis({
                                                                 document_location: { # required
                                                                   s3_object: {
                                                                     bucket: 'pireps',
                                                                     name: 'icao_type_codes.pdf'
                                                                   }
                                                                 },
                                                                 output_config: {
                                                                   s3_bucket: 'pireps', # required
                                                                   s3_prefix: 'icao_type_codes'
                                                                 },
                                                                 feature_types: ['TABLES'] # required, accepts TABLES, FORMS, QUERIES
                                                               })
    end
  end
end
Aws::Textract::Client.new.get_document_analysis({ job_id: 'dccee4f7886e79ebbf76d4ccdda0485049fc00802fa99159bb6aee8a87e18683' })
